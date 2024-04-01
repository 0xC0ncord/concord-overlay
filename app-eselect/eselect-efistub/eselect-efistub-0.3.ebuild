# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Manages unified kernel images"
HOMEPAGE="https://wiki.gentoo.org/wiki/No_homepage"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64"

RDEPEND="app-admin/eselect
		app-crypt/efitools
		app-crypt/sbsigntools
		sys-apps/systemd[gnuefi]"

src_unpack() {
	mkdir "${S}"
}

src_install() {
	insinto /usr/share/eselect/modules
	doins "${FILESDIR}"/efistub.eselect || die
}
