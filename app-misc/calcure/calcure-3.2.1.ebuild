# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="Modern TUI calendar and task manager with minimal and customizable UI"
HOMEPAGE="https://anufrievroman.gitbook.io/calcure https://github.com/anufrievroman/calcure"
SRC_URI="https://github.com/anufrievroman/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/holidays[${PYTHON_USEDEP}]
	dev-python/icalendar[${PYTHON_USEDEP}]
	dev-python/jdatetime[${PYTHON_USEDEP}]
"

src_prepare() {
	mv "${PN}.1.gz" "${PN}.1" || die
	sed -e 's|calcure\.1\.gz|calcure.1|' -i setup.py || die

	distutils-r1_src_prepare
}
