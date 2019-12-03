# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="PKCS#11 middleware for CAC/PIV smartcards"
HOMEPAGE="http://cackey.rkeene.org/"
SRC_URI="http://cackey.rkeene.org/download/${PV}/${P}.tar.gz"

LICENSE="GPL"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="dod-certs-on-hw-slots
	+dod-certs"

RDEPEND=">=sys-apps/pcsc-lite-1.6.4
	dev-libs/nss[utils]
	sys-libs/zlib"

DEPEND="${RDEPEND}
	>=app-crypt/ccid-1.4.0
	virtual/pkgconfig"
