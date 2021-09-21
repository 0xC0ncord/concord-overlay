# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit flag-o-matic savedconfig

DESCRIPTION="Hardened allocator designed for modern systems"
HOMEPAGE="https://github.com/GrapheneOS/hardened_malloc"
SRC_URI="https://github.com/GrapheneOS/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
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
		restore_config config || cp "${FILESDIR}"/config "${S}"/config || die
	else
		cp "${FILESDIR}"/config "${S}"/config || die
	fi

	if use libcxx; then
		eapply "${FILESDIR}/${PN}-libcxx.patch" || die
	fi
}

src_compile() {
	append-ldflags "-Wl,--exclude-libs,libhardened_malloc.so"
	# wrap source so as to not contaminate environment
	(
		source "${S}"/config
		emake \
			CONFIG_WERROR="${CONFIG_WERROR}" \
			CONFIG_NATIVE="${CONFIG_NATIVE}" \
			CONFIG_CXX_ALLOCATOR="${CONFIG_CXX_ALLOCATOR}" \
			CONFIG_ZERO_ON_FREE="${CONFIG_ZERO_ON_FREE}" \
			CONFIG_WRITE_AFTER_FREE_CHECK="${CONFIG_WRITE_AFTER_FREE_CHECK}" \
			CONFIG_SLOT_RANDOMIZE="${CONFIG_SLOT_RANDOMIZE}" \
			CONFIG_SLAB_CANARY="${CONFIG_SLAB_CANARY}" \
			CONFIG_SEAL_METADATA="${CONFIG_SEAL_METADATA}" \
			CONFIG_SLAB_QUARANTINE_RANDOM_LENGTH="${CONFIG_SLAB_QUARANTINE_RANDOM_LENGTH}" \
			CONFIG_SLAB_QUARANTINE_QUEUE_LENGTH="${CONFIG_SLAB_QUARANTINE_QUEUE_LENGTH}" \
			CONFIG_GUARD_SLABS_INTERVAL="${CONFIG_GUARD_SLABS_INTERVAL}" \
			CONFIG_GUARD_SIZE_DIVISOR="${CONFIG_GUARD_SIZE_DIVISOR}" \
			CONFIG_REGION_QUARANTINE_RANDOM_LENGTH="${CONFIG_REGION_QUARANTINE_RANDOM_LENGTH}" \
			CONFIG_REGION_QUARANTINE_QUEUE_LENGTH="${CONFIG_REGION_QUARANTINE_QUEUE_LENGTH}" \
			CONFIG_REGION_QUARANTINE_SKIP_THRESHOLD="${CONFIG_REGION_QUARANTINE_SKIP_THRESHOLD}" \
			CONFIG_FREE_SLABS_QUARANTINE_RANDOM_LENGTH="${CONFIG_FREE_SLABS_QUARANTINE_RANDOM_LENGTH}" \
			CONFIG_CLASS_REGION_SIZE="${CONFIG_CLASS_REGION_SIZE}" \
			CONFIG_N_ARENA="${CONFIG_N_ARENA}" \
			CONFIG_STATS="${CONFIG_STATS}" \
			CONFIG_EXTENDED_SIZE_CLASSES="${CONFIG_EXTENDED_SIZE_CLASSES}" \
			CONFIG_LARGE_SIZE_CLASSES="${CONFIG_LARGE_SIZE_CLASSES}" || die
	)
}

src_install() {
	dolib.so libhardened_malloc.so || die

	if use savedconfig; then
		save_config config
	fi
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
