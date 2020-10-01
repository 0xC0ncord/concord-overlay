# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools

DESCRIPTION="Static code analysis of refpolicy style SELinux policy"
HOMEPAGE="https://github.com/TresysTechnology/selint"
SRC_URI="https://github.com/TresysTechnology/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	dev-libs/uthash
	dev-libs/libconfuse
	dev-libs/check"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}
