# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="A QML plugin for niri"
HOMEPAGE="https://github.com/imiric/qml-niri"
SRC_URI="https://github.com/imiric/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	dev-qt/qtbase:6=[gui,network]
	dev-qt/qtdeclarative:6=
"
RDEPEND="${DEPEND}"
BDEPEND="dev-build/just"

src_install() {
	cd "${BUILD_DIR}" || die
	mv Niri/libNiri.so . || die
	dolib.so libNiri.so

	insinto "/usr/$(get_libdir)/qt6/qml"
	doins -r Niri
	fperms +x "/usr/$(get_libdir)/qt6/qml"/Niri/libNiriplugin.so
}
