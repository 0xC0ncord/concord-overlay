# Copyright 2022-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A tool for generating SELinux security profiles for containers"
HOMEPAGE="https://github.com/containers/udica"
SRC_URI="https://github.com/containers/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

src_prepare() {
	default

	# Do not install data files in the python sites
	sed '/\/usr\/share/d' -i setup.py || die
}
