# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1

MY_PN="${PN/-bin/}"
MY_P="${MY_PN/-containers/}-static-${PV}"

DESCRIPTION="Secure container runtime with lightweight virtual machines (static build)"
HOMEPAGE="https://katacontainers.io https://github.com/kata-containers/kata-containers"
SRC_URI="https://github.com/${MY_PN}/${MY_PN}/releases/download/${PV}/${MY_P}-x86_64.tar.xz -> ${P}.tar.xz"

LICENSE="Apache-2.0 BSD BSD-2 GPL-2 MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_install() {
	cd "${S}"/opt/kata || die

	dobin bin/containerd-shim-kata-v2
	dobin bin/kata-collect-data.sh
	dobin bin/kata-monitor
	dobin bin/kata-runtime

	insinto /usr/share/defaults
	doins -r share/defaults/*

	insinto /usr/share/"${MY_PN}"
	doins -r share/"${MY_PN}"/*

	dobashcomp share/bash-completion/completions/kata-runtime
}
