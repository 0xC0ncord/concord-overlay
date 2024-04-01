# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit flag-o-matic multilib-minimal readme.gentoo-r1 savedconfig

DESCRIPTION="Hardened allocator designed for modern systems"
HOMEPAGE="https://github.com/GrapheneOS/hardened_malloc"
SRC_URI="https://github.com/GrapheneOS/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libcxx"

DEPEND=">=sys-libs/glibc-2.28"
RDEPEND="${DEPEND}"
BDEPEND="|| ( >=sys-devel/clang-7.0 >=sys-devel/gcc-8.3.0 )"

src_prepare() {
	default

	if use savedconfig; then
		restore_config gentoo.mk || cp "${FILESDIR}"/gentoo.mk config/gentoo.mk || die
	else
		cp "${FILESDIR}"/gentoo.mk config/gentoo.mk || die
	fi

	use savedconfig && save_config config/gentoo.mk

	if use libcxx; then
		eapply "${FILESDIR}/${PN}-libcxx.patch" || die
	fi
}

multilib_src_compile() {
	if ! multilib_is_native_abi; then
		# Create a dummy library for 32-bit builds
		# This allows linking against hardened_malloc in
		# LDFLAGS without erroring on multilib packages
		printf 'ASSERT((1), "");' > libhardened_malloc.so || die
	else
		filter-flags "-lhardened_malloc" "-Wl,-lhardened_malloc"
		cd "${S}" || die
		emake VARIANT=gentoo SUFFIX= OUT="${BUILD_DIR}" || die
	fi
}

multilib_src_install() {
	cd "${BUILD_DIR}" || die
	dolib.so libhardened_malloc.so
}

src_install() {
	readme.gentoo_create_doc
	multilib-minimal_src_install
}

pkg_postinst() {
	readme.gentoo_print_elog

	local enabled=( $(multilib_get_enabled_abis) )
	if [ ${#enabled[@]} -gt 1 ]; then
		elog "One or more multilib dummy libraries were installed."
	fi
}
