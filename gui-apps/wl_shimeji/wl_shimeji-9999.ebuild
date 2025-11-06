# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )

inherit python-r1 systemd

DESCRIPTION="Shimeji reimplementation for Wayland in C"
HOMEPAGE="https://github.com/CluelessCatBurger/wl_shimeji"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/CluelessCatBurger/${PN}"
	KEYWORDS=""
else
	SRC_URI="https://github.com/CluelessCatBurger/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="GPL-2"
SLOT="0"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	app-arch/libarchive
	dev-libs/json-h
	dev-libs/qoi
	dev-libs/uthash
	dev-libs/wayland
	dev-libs/wayland-protocols
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/py-qoi[${PYTHON_USEDEP}]
	${PYTHON_DEPS}
"
DEPEND="${RDEPEND}"
BDEPEND="${RDEPEND}"

src_prepare() {
	eapply_user

	sed -e 's|#include "third_party/qoi/qoi.h"|#include <qoi.h>|' \
		-e 's|#include "third_party/json.h/json.h"|#include <json.h>|' \
		-i src/mascot_atlas.c \
		   src/mascot_config_parser.c || die
}

src_install() {
	dobin build/shimeji-overlayd

	emake utils/shimejictl
	sed 's|qoi.src.qoi|qoi.qoi|' -i utils/shimejictl || die
	python_foreach_impl python_doscript utils/shimejictl

	mkdir "${PN}" || die
	mv src/plugins.h src/master_header.h "${PN}" || die
	doheader -r "${PN}"

	systemd_douserunit "systemd/${PN}.service"
	systemd_douserunit "systemd/${PN}.socket"
}
