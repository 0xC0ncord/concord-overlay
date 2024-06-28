# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1 optfeature

MY_PV="${PV//_p}"

DESCRIPTION="TUI and CLI for the BitTorrent client Transmission"
HOMEPAGE="https://github.com/rndusr/stig"
SRC_URI="https://github.com/rndusr/${PN}/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RDEPEND="
	${PYTHON_DEPS}
	dev-python/natsort[${PYTHON_USEDEP}]
	>=dev-python/urwid-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/urwidtrees-1.0.3[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/pyxdg[${PYTHON_USEDEP}]
	dev-python/blinker[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]
	dev-python/mock[${PYTHON_USEDEP}]
	dev-python/multidict[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${PN}-${MY_PV}"

pkg_postinst() {
	optfeature "stripping arguments from process title when running in tmux sessions" dev-python/setproctitle
	optfeature "SOCKS5, SOCKS4, or HTTP proxy tunneling support" dev-python/aiohttp-socks
}
