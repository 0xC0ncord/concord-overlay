# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake multilib-minimal

DESCRIPTION="CUnit is a Unit testing framework for C"
HOMEPAGE="https://gitlab.com/cunity/cunit"
SRC_URI="https://gitlab.com/cunity/${PN}/-/archive/${PV}/${P}.tar.bz2"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples test"

src_prepare() {
	cmake_src_prepare

	# Fix libdir installation target
	sed -i '/install(TARGETS/ s/lib/${CMAKE_INSTALL_LIBDIR}/' "${CMAKE_USE_DIR}"/CUnit/CMakeLists.txt || die

	# Modify the target directory to conform to expected paths
	sed -i 's#CUnit/share/cmake#share/CUnit/cmake#' "${CMAKE_USE_DIR}"/CUnit/CMakeLists.txt || die
}

multilib_src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_LIBDIR=$(get_libdir)
		-DCUNIT_DISABLE_EXAMPLES=ON # dont actually build example programs
		-DCUNIT_DISABLE_TESTS=$(usex test OFF ON)
	)

	cmake_src_configure
}

multilib_src_compile() {
	cmake_src_compile
}

multilib_src_install() {
	cmake_src_install
}

multilib_src_install_all() {
	use examples || return 0

	mv "${S}"/Examples "${S}"/examples || die
	dodoc -r "${S}"/examples
}
