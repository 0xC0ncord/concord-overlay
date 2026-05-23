# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER=1.93

inherit bash-completion-r1 cargo optfeature systemd

MY_PV="${PV/rc/rc.}"
MY_PV="${MY_PV/_/-}"
MY_P="kanidm-${MY_PV}"

DESCRIPTION="Kanidm Server Daemon"
HOMEPAGE="https://kanidm.com https://github.com/kanidm/kanidm"
SRC_URI="https://github.com/kanidm/kanidm/archive/v${MY_PV}.tar.gz -> kanidm-${PV}.tar.gz"
if [[ ${PKGBUMPING} != ${PVR} ]]; then
	SRC_URI+=" https://distfiles.gentoo.org/pub/dev/concord@gentoo.org/${MY_P}-crates.tar.xz"
fi

S="${WORKDIR}/${MY_P}"

LICENSE="MPL-2.0"
# Dependent crate licenses
LICENSE+="
	0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD CC0-1.0
	CDLA-Permissive-2.0 ISC LGPL-3 MIT MIT-0 MPL-2.0 MPL-2.0 openssl
	Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

IUSE="doc"
PDEPEND="doc? ( ~app-doc/kanidm-docs-${PV} )"
RDEPEND="
	acct-user/kanidmd
	dev-db/sqlite:3
	dev-libs/openssl:=
	sys-libs/zlib
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-arch/zstd
	llvm-core/lld
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/.*"

src_compile() {
	# Unpatch unstable crates
	{
		awk -v RS= -v ORS="\n\n" '
		{
			if ($0 ~ /^\[patch\.crates-io\]/m) {
				n = split($0, lines, "\n")
				for (i = 1; i <= n; i++) {
					if (lines[i] ~ /^\[patch\..*\]/) continue
					if (lines[i] ~ /^\s*$/) continue
					patches = patches lines[i] "\n"
				}
			} else { print $0 }
		}
		END { if (patches != "") print "[patch.crates-io]\n" patches }
		' "${CARGO_HOME}"/config.toml >"${CARGO_HOME}"/config.toml.new && \
			mv "${CARGO_HOME}"/config.toml.new "${CARGO_HOME}"/config.toml
	} || die Failed patching cargo config

	export KANIDM_BUILD_PROFILE=release_linux
	cargo_src_compile --bin kanidmd
	cargo_src_compile -p kanidm-ipa-sync
	cargo_src_compile -p kanidm-ldap-sync
}

src_install() {
	dosbin "$(cargo_target_dir)"/kanidmd
	dosbin "$(cargo_target_dir)"/kanidm-ipa-sync
	dosbin "$(cargo_target_dir)"/kanidm-ldap-sync

	insinto /etc/kanidm
	doins examples/server.toml

	fowners kanidmd:root /etc/kanidm/server.toml
	fperms 0400 /etc/kanidm/server.toml

	keepdir /var/lib/kanidm
	fowners kanidmd:root /var/lib/kanidm
	fperms 0700 /var/lib/kanidm

	newconfd "${FILESDIR}/kanidmd.confd" kanidmd

	newinitd "${FILESDIR}/kanidmd.initd" kanidmd
	systemd_dounit platform/opensuse/kanidmd.service
	systemd_install_serviced "${FILESDIR}"/kanidmd.service.conf

	systemd_dounit platform/opensuse/kanidm-ipa-sync.service

	# web interface files
	insinto /usr/share/kanidm/ui/hpkg
	doins -r server/core/static/*

	newbashcomp "$(cargo_target_dir)"/build/completions/kanidmd.bash kanidmd

	insinto /usr/share/zsh/site-functions
	doins "$(cargo_target_dir)"/build/completions/_kanidmd
}

pkg_postinst() {
	optfeature "clients to administrate the Kanidm Server" net-nds/kanidm-clients
	optfeature "Unix integration clients with the Kanidm Server" net-nds/kanidm-unixd-clients
}
