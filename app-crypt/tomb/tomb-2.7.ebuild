# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A minimalistic commandline tool to manage encrypted volumes aka The Crypto Undertaker"
HOMEPAGE="https://github.com/dyne/Tomb"
SRC_URI="https://github.com/dyne/Tomb/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="app-admin/sudo
	app-crypt/gnupg
	sys-fs/cryptsetup
	app-crypt/pinentry"
RDEPEND="app-shells/zsh
	${DEPEND}"

S="${WORKDIR}/Tomb-${PV}"

PATCHES="${FILESDIR}/${P}-gentoo-policy-paths.patch"

src_compile(){
	true
}

pkg_postinst() {
	einfo "NOTE: Some additional programs may be installed to extend tomb's functionality:"
	einfo "sys-process/lsof   - slam a tomb (close even if open programs)"
	einfo "sys-apps/dcfldd    - show progress while digging tombs and keys"
	einfo "app-crypt/steghide - bury and exhume keys inside images"
	einfo "sys-fs/e2fsprogs   - extend the size of existing tomb volumes"
	einfo "media-gfx/qrencode - engrave keys into printable qrcode sheets"
	einfo "sys-apps/mlocate   - fast search of file names inside tombs"
	einfo "???-???/swish++    - fast search of file contents inside tombs"
	einfo "app-office/unoconv - fast search of contents in PDF and DOC files"
	einfo "app-text/lesspipe  - fast search of contents in compressed archives"
	einfo "sys-apps/haveged   - fast entropy generation for key forging"
}
