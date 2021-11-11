# Copyright 2019-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..10} )
DISTUTILS_USE_SETUPTOOLS="pyproject.toml"
inherit distutils-r1

DESCRIPTION="Unpadded Base64"
HOMEPAGE="https://github.com/matrix-org/python-unpaddedbase64 https://pypi.python.org/pypi/unpaddedbase64"
SRC_URI="https://github.com/matrix-org/python-unpaddedbase64/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/python-${P}"
