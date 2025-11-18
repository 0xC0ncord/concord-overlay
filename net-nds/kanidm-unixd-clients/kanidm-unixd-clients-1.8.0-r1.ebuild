# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER=1.90

inherit bash-completion-r1 cargo pam systemd

MY_PV="${PV/rc/rc.}"
MY_PV="${MY_PV/_/-}"
MY_P="kanidm-${MY_PV}"

DESCRIPTION="Kanidm Unix Integration Clients"
HOMEPAGE="https://kanidm.com https://github.com/kanidm/kanidm"
SRC_URI="https://github.com/kanidm/kanidm/archive/v${MY_PV}.tar.gz -> kanidm-${PV}.tar.gz"
if [[ ${PKGBUMPING} != ${PVR} ]]; then
	SRC_URI+=" https://dev.gentoo.org/~concord/distfiles/${MY_P}-crates.tar.xz"
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

IUSE="doc selinux tpm"
PDEPEND="doc? ( ~app-doc/kanidm-docs-${PV} )"
RDEPEND="
	acct-user/kanidm-unixd
	~net-nds/kanidm-clients-${PV}
	dev-libs/openssl:=
	sys-libs/pam
	virtual/udev
	selinux? ( llvm-core/clang:* )
	tpm? ( app-crypt/tpm2-tss:0= )
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

	local features="unix"
	use selinux && features+=",selinux"
	use tpm && features+=",tpm"

	export KANIDM_BUILD_PROFILE=release_linux
	cargo_src_compile \
		--bin kanidm_ssh_authorizedkeys \
		--bin kanidm_ssh_authorizedkeys_direct
	cargo_src_compile -p pam_kanidm
	cargo_src_compile -p nss_kanidm
	cargo_src_compile --features "${features}" -p kanidm_unix_int \
		--bin kanidm_unixd \
		--bin kanidm_unixd_tasks \
		--bin kanidm-unix
}

src_install() {
	dosbin "$(cargo_target_dir)"/kanidm_ssh_authorizedkeys
	dosbin "$(cargo_target_dir)"/kanidm_ssh_authorizedkeys_direct

	newlib.so "$(cargo_target_dir)"/libnss_kanidm.so libnss_kanidm.so.2
	newpammod "$(cargo_target_dir)"/libpam_kanidm.so pam_kanidm.so

	dosbin "$(cargo_target_dir)"/kanidm_unixd
	dosbin "$(cargo_target_dir)"/kanidm_unixd_tasks
	dobin "$(cargo_target_dir)"/kanidm-unix

	insinto /etc/kanidm
	doins examples/unixd

	keepdir /var/lib/kanidm-unixd
	fowners kanidm-unixd:nobody /var/lib/kanidm-unixd
	fperms 0700 /var/lib/kanidm-unixd

	newconfd "${FILESDIR}/kanidm-unixd.confd" kanidm-unixd

	newinitd "${FILESDIR}/kanidm-unixd.initd" kanidm-unixd
	newinitd "${FILESDIR}/kanidm-unixd-tasks.initd" kanidm-unixd-tasks
	systemd_dounit platform/opensuse/kanidm-unixd.service
	systemd_dounit platform/opensuse/kanidm-unixd-tasks.service
	systemd_install_serviced "${FILESDIR}"/kanidm-unixd.service.conf

	newbashcomp "$(cargo_target_dir)"/build/completions/kanidm_ssh_authorizedkeys.bash kanidm_ssh_authorizedkeys
	newbashcomp "$(cargo_target_dir)"/build/completions/kanidm_ssh_authorizedkeys_direct.bash kanidm_ssh_authorizedkeys_direct
	newbashcomp "$(cargo_target_dir)"/build/completions/kanidm_unix.bash kanidm_unix

	insinto /usr/share/zsh/site-functions
	doins "$(cargo_target_dir)"/build/completions/_kanidm_ssh_authorizedkeys
	doins "$(cargo_target_dir)"/build/completions/_kanidm_ssh_authorizedkeys_direct
	doins "$(cargo_target_dir)"/build/completions/_kanidm_unix
}
