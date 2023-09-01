# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="PKCS#11 middleware for CAC/PIV smartcards"
HOMEPAGE="http://cackey.rkeene.org/"
SRC_URI="http://cackey.rkeene.org/download/${PV}/${P}.tar.gz"

LICENSE="LGPL-2.1 MIT MPL-2.0"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+dod-certs dod-certs-on-hw-slots"

RDEPEND="
	>=sys-apps/pcsc-lite-1.6.4
    dev-libs/nss[utils]
    sys-libs/zlib
"

DEPEND="
    ${RDEPEND}
    >=app-crypt/ccid-1.4.0
    virtual/pkgconfig
"
