# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

MY_GIT_COMMIT="29e13c4"

DESCRIPTION="iCalendar parser library for Python"
HOMEPAGE="
	https://github.com/collective/icalendar
	https://icalendar.readthedocs.io
"
SRC_URI="https://files.pythonhosted.org/packages/source/i/${PN}/${P}.tar.gz"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/tzdata[${PYTHON_USEDEP}]
"
