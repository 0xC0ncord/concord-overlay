# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1 optfeature

DESCRIPTION="TUI and CLI for the BitTorrent client Transmission"
HOMEPAGE="https://github.com/rndusr/stig"
SRC_URI="https://github.com/rndusr/${PN}/archive/v${PV}a0.tar.gz -> ${P}a0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="
	${PYTHON_DEPS}
	dev-python/natsort[${PYTHON_USEDEP}]
	>=dev-python/urwid-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/urwidtrees-1.0.3[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/async_timeout[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/multidict[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${PN}-${PV}a0"

pkg_postinst() {
	optfeature "stripping arguments from process title when running in tmux sessions" dev-python/setproctitle
	optfeature "SOCKS5, SOCKS4, or HTTP proxy tunneling support" dev-python/aiohttp-socks
}
