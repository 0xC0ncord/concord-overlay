# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..13} )

inherit distutils-r1

DESCRIPTION="Mopidy extension for controlling playback from MPD clients"
HOMEPAGE="https://github.com/mopidy/mopidy-mpd"
SRC_URI="https://github.com/mopidy/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	>=dev-python/pykka-4.0.0[${PYTHON_USEDEP}]
	media-sound/mopidy
"
RDEPEND="${DEPEND}"

distutils_enable_tests pytest
