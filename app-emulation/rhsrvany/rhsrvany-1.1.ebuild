# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools flag-o-matic

DESCRIPTION="Utility for creating a service from any MinGW Windows binary"
HOMEPAGE="https://github.com/rwmjones/rhsrvany"
SRC_URI="https://github.com/rwmjones/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-util/mingw64-toolchain"
RDEPEND="${DEPEND}"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	PATH=${BROOT}/usr/lib/mingw64-toolchain/bin:${PATH}

	# random segfaults been reported with LTO in some games, filter as
	# a safety (note that optimizing this further won't really help
	# performance, GPU does the actual work)
	filter-lto

	# -mavx and mingw-gcc do not mix safely here
	# https://github.com/doitsujin/dxvk/issues/4746#issuecomment-2708869202
	append-flags -mno-avx

	if [[ ${CHOST} != *-mingw* ]]; then
		if [[ ! -v MINGW_BYPASS ]]; then
			unset AR CC CXX RC STRIP
			filter-flags '-fuse-ld=*'
			filter-flags '-mfunction-return=thunk*' #878849

			# some bashrc-mv users tend to do CFLAGS="${LDFLAGS}" and then
			# strip-unsupported-flags miss these during compile-only tests
			# (primarily done for 23.0 profiles' -z, not full coverage)
			filter-flags '-Wl,-z,*' #928038
		fi

		CHOST_amd64=x86_64-w64-mingw32
		CHOST_x86=i686-w64-mingw32
		CHOST=$(usex x86 ${CHOST_x86} ${CHOST_amd64})

		strip-unsupported-flags
	fi

	default
}

src_install() {
	emake DESTDIR="${ED}" bindir=/usr/share/virt-tools install
	einstalldocs
}
