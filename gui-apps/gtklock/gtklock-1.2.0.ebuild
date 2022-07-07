# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="GTK-based lockscreen for Wayland"
HOMEPAGE="https://github.com/jovanlanik/gtklock"
SRC_URI="https://github.com/jovanlanik/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="gui-libs/gtk-layer-shell
	gui-libs/wayland-client
	x11-libs/gtk+:3="
RDEPEND="${DEPEND}"

src_install() {
	local DOCS=( README.md )

	einstalldocs

	emake DESTDIR="${ED}" PREFIX="/usr" install
}
