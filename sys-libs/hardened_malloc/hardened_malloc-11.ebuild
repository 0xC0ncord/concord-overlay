# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit flag-o-matic multilib-minimal savedconfig

DESCRIPTION="Hardened allocator designed for modern systems"
HOMEPAGE="https://github.com/GrapheneOS/hardened_malloc"
SRC_URI="https://github.com/GrapheneOS/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="libcxx"

DEPEND="
	>=sys-libs/glibc-2.28
"
RDEPEND="${DEPEND}"
BDEPEND="
	|| ( >=sys-devel/clang-7.0 >=sys-devel/gcc-8.3.0 )
"

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
		printf 'ASSERT((1), "");' > libhardened_malloc.so
	else
		append-ldflags "-Wl,--exclude-libs,libhardened_malloc.so"
		local OUT="${PWD}"
		cd "${S}"
		emake VARIANT=gentoo SUFFIX= OUT="${OUT}" || die
	fi
}

multilib_src_install() {
	dolib.so libhardened_malloc.so || die
}

pkg_postinst() {
	einfo "To use hardened_malloc, either add it as a preloaded library to /etc/ld.so.preload,"
	einfo "use the LD_PRELOAD environment variable, or include it manually in your LDFLAGS,"
	einfo "keeping in mind link order."
	einfo
	einfo "Please note that some programs may break when linked against hardened_malloc."
	einfo
	einfo "Make sure to raise vm.max_map_count substantially to accomodate the very large"
	einfo "number of guard pages created by hardened_malloc."
	einfo "i.e. \`echo 'vm.max_map_count = 524240' > /etc/sysctl.d/hardened_malloc.conf\`"
	einfo
	einfo "See https://github.com/GrapheneOS/hardened_malloc#traditional-linux-based-operating-systems"

	local enabled=( $(multilib_get_enabled_abis) )
	if [ ${#enabled[@]} -gt 1 ]; then
		einfo
		einfo "One or more multilib compatibility libraries were installed."
		einfo
		einfo "Note that these libraries do not actually affect built programs in any way."
		einfo "Their only purpose is to allow you to link directly against hardened_malloc wihtout"
		einfo "running into compilation problems."
		einfo "Do not expect hardened_malloc to work on any ABIs that are not your native platform."
	fi
}
