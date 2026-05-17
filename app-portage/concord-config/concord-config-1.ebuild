# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Opinionated scripts and config files for Gentoo systems"
HOMEPAGE="https://codeberg.org/concord/concord-config"
SRC_URI="https://codeberg.org/concord/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}"

src_compile() {
	true
}

src_install() {
	emake DESTDIR="${ED}" PREFIX= install
}
