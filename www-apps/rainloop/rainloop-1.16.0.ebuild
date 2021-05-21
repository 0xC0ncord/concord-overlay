# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit webapp

MY_BRANCH=$(ver_cut 1-2)

DESCRIPTION="Simple, modern & fast web-based email client"
HOMEPAGE="https://www.rainloop.net"
SRC_URI="https://github.com/RainLoop/rainloop-webmail/releases/download/v${PV}/${PN}-community-${PV}.zip"

LICENSE="AGPL-3"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE=""

RDEPEND=">=dev-lang/php-7.3.19
	virtual/httpd-php"

need_httpd_cgi

RESTRICT="test"

S="${WORKDIR}"

src_install() {
	webapp_src_preinst
	webapp_src_install
}

pkg_postinst() {
	webapp_pkg_postinst
}
