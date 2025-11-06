# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_GIT_COMMIT=4ab68bbd20618a663255625160c40875713f5485

DESCRIPTION="The \"Quite OK Image Format\" for fast, lossless image compression"
HOMEPAGE="https://github.com/phoboslab/qoi"
SRC_URI="https://github.com/phoboslab/${PN}/archive/${MY_GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/qoi-${MY_GIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	true
}

src_install() {
	doheader qoi.h
}
