# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit flag-o-matic

DESCRIPTION="Hardened allocator designed for modern systems"
HOMEPAGE="https://github.com/GrapheneOS/hardened_malloc"
SRC_URI="https://github.com/GrapheneOS/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libcxx +werror +cxx +zero-on-free +write-after-free-check +slot-randomize +slab-canary seal-metadata"

DEPEND="
	>=sys-libs/glibc-2.28
"
RDEPEND="${DEPEND}"
BDEPEND="
	|| ( >=sys-devel/clang-7.0 >=sys-devel/gcc-8.3.0 )
"

src_prepare() {
	if use libcxx; then
		eapply ${FILESDIR}/${PN}-libcxx.patch || die
	fi
	default
}

src_compile() {
	append-ldflags "-Wl,--exclude-libs,libhardened_malloc.so"
	emake \
		CONFIG_WERROR=$(usex werror true false) \
		CONFIG_NATIVE=false \
		CONFIG_CXX_ALLOCATOR=$(usex cxx true false) \
		CONFIG_ZERO_ON_FREE=$(usex zero-on-free true false) \
		CONFIG_WRITE_AFTER_FREE_CHECK=$(usex write-after-free-check true false) \
		CONFIG_SLOT_RANDOMIZE=$(usex slot-randomize true false) \
		CONFIG_SLAB_CANARY=$(usex slab-canary true false) \
		CONFIG_SEAL_METADATA=$(usex seal-metadata true false) || die
}

src_install() {
	dolib.so libhardened_malloc.so || die
}

pkg_postinst() {
	einfo "To use hardened_malloc, either add it as a preloaded library to /etc/ld.so.preload,"
	einfo "use the LD_PRELOAD environment variable, or include it manually in your LDFLAGS,"
	einfo "keeping in mind link order."
	einfo
	einfo "Note that hardened_malloc is known to break packages built using newer memory safe"
	einfo "languages such as Rust or Go. Such packages can be excluded from linking with"
	einfo "hardened_malloc with '-Wl,--exclude-libs,libhardened_malloc.so' in LDFLAGS."
	einfo
	einfo "Make sure to raise vm.max_map_count substantially to accomodate the very large"
	einfo "number of guard pages created by hardened_malloc."
	einfo "i.e. \`echo 'vm.max_map_count = 524240' > /etc/sysctl.d/hardened_malloc.conf\`"
	einfo
	einfo "See https://github.com/GrapheneOS/hardened_malloc#traditional-linux-based-operating-systems"
}
