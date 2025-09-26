# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="Open World Holidays Framework"
HOMEPAGE="
	https://github.com/vacanza/holidays
	https://pypi.org/project/holidays
"
SRC_URI="https://github.com/vacanza/holidays/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest

RDEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}]
"
