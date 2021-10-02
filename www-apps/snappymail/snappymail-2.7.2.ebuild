# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit webapp

DESCRIPTION="Simple, modern & fast web-based email client"
HOMEPAGE="https://snappymail.eu"
SRC_URI="https://github.com/the-djmaze/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="AGPL-3"
KEYWORDS="~amd64"
IUSE=""
REQUIRED_USE=""

RDEPEND=">=dev-lang/php-7.4
		virtual/httpd-php"

need_httpd_cgi

RESTRICT="test"

S="${WORKDIR}"

src_install() {
	webapp_src_preinst

	rm README.md

	sed -i 's/\/var\/lib\/snappymail//' include.php || die

	insinto "${MY_HTDOCSDIR}"
	doins -r .

	webapp_serverowned -R "${MY_HTDOCSDIR}"/data
	webapp_serverowned -R "${MY_HTDOCSDIR}"/snappymail
	webapp_serverowned "${MY_HTDOCSDIR}"/include.php
	webapp_serverowned "${MY_HTDOCSDIR}"/index.php
	webapp_serverowned "${MY_HTDOCSDIR}"/serviceworker.js
	webapp_serverowned "${MY_HTDOCSDIR}"/.htaccess

	webapp_src_install
}

pkg_postinst() {
	webapp_pkg_postinst
}
