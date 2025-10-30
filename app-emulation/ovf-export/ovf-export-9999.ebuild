# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit bash-completion-r1 go-module

DESCRIPTION="OVF/OVA export tool for libvirt"
HOMEPAGE="https://github.com/Enrico204/ovf-export"
if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/Enrico204/${PN}"
	inherit git-r3
else
	SRC_URI="https://github.com/Enrico204/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	SRC_URI+=" https://dev.gentoo.org/~concord/distfiles/${P}-deps.tar.xz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

BDEPEND=">=dev-lang/go-1.19"

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
		go-module_live_vendor
	else
		default
	fi
	go-module_src_unpack
}

src_compile() {
	for i in ./cmd/*; do
		ego build -ldflags="-s -w" -o ./dist/ "${i}"
	done
}

src_install() {
	for i in ./dist/*; do
		dobin "${i}"
	done
}
