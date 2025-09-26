# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="Jalali calendar binding for Python based on Python's datetime module"
HOMEPAGE="
	https://github.com/slashmili/jdatetime
	http://pypi.python.org/pypi/jdatetime
"
SRC_URI="https://github.com/slashmili/jdatetime/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest
