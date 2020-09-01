# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="TUI and CLI for the BitTorrent client Transmission"
HOMEPAGE="https://github.com/rndusr/stig"
SRC_URI="https://github.com/rndusr/${PN}/archive/v${PV}a0.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="setproctitle"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="
	${PYTHON_DEPS}
	dev-python/natsort[${PYTHON_USEDEP}]
	>=dev-python/urwid-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/urwidtrees-1.0.3[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/async_timeout[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]
	setproctitle? ( dev-python/setproctitle[${PYTHON_USEDEP}] )
	dev-python/mock[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${PN}-${PV}a0"
