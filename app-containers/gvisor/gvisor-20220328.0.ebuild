# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Application kernel for containers"
HOMEPAGE="https://gvisor.dev https://github.com/google/gvisor"
SRC_URI="https://github.com/google/${PN}/archive/tags/release-${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="network-sandbox"

IUSE="shim"

BDEPEND="dev-util/bazel"
DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-tags-release-${PV}"

src_compile() {
	bazel build //runsc || die "Failed to build runsc"
	use shim && bazel build //shim:containerd-shim-runsc-v1 || die "Failed to build containerd-shim"
}

src_install() {
	cd "${S}" || die # Fix deleted cwd warnings

	dobin $(find bazel-out/ -type f -name 'runsc') || die "Failed to install runsc"

	if use shim ; then
		dobin $(find bazel-out/ -type f -name 'containerd-shim-runsc-v1') || die "Failed to install containerd-shim"
	fi
}
