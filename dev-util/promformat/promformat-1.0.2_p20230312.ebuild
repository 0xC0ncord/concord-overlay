# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

EGIT_COMMIT="bb0fb08dd60ad06796e0ce058d157e0b6f0f3d95"

DESCRIPTION="PromQL formatter"
HOMEPAGE="https://github.com/facetoe/promformat"
SRC_URI="https://github.com/facetoe/promformat/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-python/antlr4-python3-runtime[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest
