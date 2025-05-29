# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit meson

DESCRIPTION="Universal Wayland Session Manager"
HOMEPAGE="https://github.com/Vladimir-csp/uwsm"
SRC_URI="https://github.com/Vladimir-csp/uwsm/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+man"

src_configure() {
	local emesonargs=(
		-Duuctl=enabled
		-Dfumon=enabled
		-Duwsm-app=enabled
		$(meson_feature man man-pages)
		-Ddocdir=/usr/share/doc/"${PF}"
	)
	meson_src_configure
}
