# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1

DESCRIPTION="Module for converting between datetime.timedelta and Go's Duration strings"
HOMEPAGE="
	https://github.com/icholy/durationpy
	https://pypi.org/project/durationpy/
"
SRC_URI="https://github.com/icholy/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT.0"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests setup.py
