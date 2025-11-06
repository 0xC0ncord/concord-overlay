# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=no
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

MY_GIT_COMMIT=c576a79f556f4b4cce0735545c80294371054bbd

DESCRIPTION="QOI image encoder/decoder written in python"
HOMEPAGE="https://github.com/mathpn/py-qoi"
SRC_URI="https://github.com/mathpn/${PN}/archive/${MY_GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=">=dev-python/pillow-9.0.1[${PYTHON_USEDEP}]"

S="${WORKDIR}/${PN}-${MY_GIT_COMMIT}"

python_install() {
	mv src qoi || die
	python_domodule qoi
}
