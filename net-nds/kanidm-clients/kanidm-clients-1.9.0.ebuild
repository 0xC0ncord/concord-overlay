# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

RUST_MIN_VER=1.93

inherit bash-completion-r1 cargo

MY_PV="${PV/rc/rc.}"
MY_PV="${MY_PV/_/-}"
MY_P="kanidm-${MY_PV}"

DESCRIPTION="Kanidm Client Tools"
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

IUSE="doc"
PDEPEND="doc? ( ~app-doc/kanidm-docs-${PV} )"
RDEPEND="
	dev-libs/openssl:=
	sys-libs/zlib
	virtual/udev
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-arch/zstd
	llvm-core/lld
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/kanidm"

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
	# --bin to avoid building unneeded ssh keys client
	cargo_src_compile -p kanidm_tools --bin kanidm
}

src_install() {
	dobin "$(cargo_target_dir)"/kanidm

	insinto /etc/kanidm
	doins examples/config

	newbashcomp "$(cargo_target_dir)"/build/completions/kanidm.bash kanidm
	insinto /usr/share/zsh/site-functions
	doins "$(cargo_target_dir)"/build/completions/_kanidm
}
