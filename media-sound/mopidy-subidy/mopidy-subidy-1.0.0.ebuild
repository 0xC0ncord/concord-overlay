# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

DESCRIPTION="Mopidy extension for playing music from Subsonic servers"
HOMEPAGE="https://github.com/Prior99/mopidy-subidy"
SRC_URI="https://github.com/Prior99/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/py-sonic-0.7.7[${PYTHON_USEDEP}]
	>=dev-python/pykka-2.0.1[${PYTHON_USEDEP}]
	media-plugins/gst-plugins-soup:1.0
	media-sound/mopidy
"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest
