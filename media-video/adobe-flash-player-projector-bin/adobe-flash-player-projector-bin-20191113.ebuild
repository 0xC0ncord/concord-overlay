# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="Standalone Adobe Flash player"
HOMEPAGE="https://www.adobe.com/support/flashplayer/debug_downloads.html"
SRC_URI="https://fpdownload.macromedia.com/pub/flashplayer/updaters/32/flash_player_sa_linux.x86_64.tar.gz -> ${P}.tar.gz"

LICENSE="AdobeFlash-11.x"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="
	dev-libs/atk
	dev-libs/glib:2
	dev-libs/nspr
	dev-libs/nss
	media-libs/fontconfig
	media-libs/freetype
	>=sys-libs/glibc-2.4
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:2
	x11-libs/libX11
	x11-libs/libXcursor
	x11-libs/libXext
	x11-libs/libXrender
	x11-libs/libXt
	x11-libs/pango
"
BDEPEND=""

S="${WORKDIR}"

src_install() {
	dobin flashplayer
}
