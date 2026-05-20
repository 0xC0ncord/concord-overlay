# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cargo optfeature

DESCRIPTION="A terminal-based Subsonic music client with bit-perfect audio playback"
HOMEPAGE="https://github.com/Jamie098/ferrosonic-ng"
SRC_URI="https://github.com/Jamie098/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
if [[ ${PKGBUMPING} != ${PVR} ]]; then
	SRC_URI+="
		${P}-crates.tar.xz
	"
fi

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 BSD CDLA-Permissive-2.0 ISC MIT MPL-2.0 Unicode-3.0 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	media-video/mpv:=[libmpv]
	!media-sound/ferrosonic
"
DEPEND="${RDPEND}"

pkg_postinst() {
	optfeature "audio visualizer support" media-sound/cava
}
