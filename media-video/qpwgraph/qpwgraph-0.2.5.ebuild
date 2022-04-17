# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg

DESCRIPTION="A pipewire graph Qt GUI interface"
HOMEPAGE="https://gitlab.freedesktop.org/rncbc/qpwgraph/"
SRC_URI="https://gitlab.freedesktop.org/rncbc/${PN}/-/archive/v${PV}/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"
IUSE="debug midi tray wayland"

DEPEND="dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtwidgets:5
		dev-qt/qtxml:5
		dev-qt/qtsvg:5
		>=media-video/pipewire-0.3:=
		midi? ( media-libs/alsa-lib )
		tray? ( dev-qt/qtnetwork:5 )
"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-v${PV}"

src_configure() {
	local mycmakeargs=(
		-DCONFIG_ALSA_MIDI=$(usex midi 1 0)
		-DCONFIG_DEBUG=$(usex debug 1 0)
		-DCONFIG_SYSTEM_TRAY=$(usex tray 1 0)
		-DCONFIG_WAYLAND=$(usex wayland 1 0)
		-DCONFIG_QT6=0
	)

	cmake_src_configure
}
