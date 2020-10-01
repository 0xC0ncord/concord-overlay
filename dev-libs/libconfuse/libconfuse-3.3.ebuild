# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Small configuration file parser library for C"
HOMEPAGE="https://github.com/libconfuse/libconfuse"
SRC_URI="https://github.com/libconfuse/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	sys-devel/gettext
	sys-devel/flex"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
