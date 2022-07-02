# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit webapp

DESCRIPTION="Simple, modern & fast web-based email client"
HOMEPAGE="https://snappymail.eu"
SRC_URI="https://github.com/the-djmaze/${PN}/releases/download/v${PV}/${P}.tar.gz"

LICENSE="AGPL-3"
KEYWORDS="~amd64"

RDEPEND=">=dev-lang/php-7.3[imap]
	virtual/httpd-php"

need_httpd_cgi

S="${WORKDIR}"

pkg_setup() {
	webapp_pkg_setup
}

src_install() {
	webapp_src_preinst

	dodoc README.md
	rm README.md || die

	mv _include.php include.php || die

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
