# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools

DESCRIPTION="Enclosure LED Utilities"
HOMEPAGE="https://github.com/intel/ledmon"
SRC_URI="https://github.com/intel/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

IUSE=""

DEPEND="sys-apps/pciutils
		sys-apps/sg3_utils
		virtual/libudev:="
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	# systemd arg is only used for installing the systemd unit
	local myeconfargs=(
		--enable-systemd
	)
	econf "${myeconfargs[@]}"
}
