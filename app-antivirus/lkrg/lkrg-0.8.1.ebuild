# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod linux-info

DESCRIPTION="Linux Kernel Runtime Guard"
HOMEPAGE="https://www.openwall.com/lkrg/"
SRC_URI="https://www.openwall.com/lkrg/${P}.tar.gz"
LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~amd64 ~x86"
IUSE=""

MODULE_NAMES="p_lkrg(misc:${S}:${S})"
BUILD_TARGETS="clean all"
CONFIG_CHECK="
	JUMP_LABEL

	MODULES MODULE_UNLOAD
	KPROBES
	KALLSYMS_ALL
"

PATCHES="${FILESDIR}/lkrg-0.8.1-fix-failure-path.patch"

src_prepare() {
	if kernel_is -ge 5 8; then
		eapply "${FILESDIR}/lkrg-0.8.1_linux-5.8.patch"
		eapply "${FILESDIR}/lkrg-0.8.1_linux-5.8-no-rhel-fix.patch"
		eapply "${FILESDIR}/lkrg-0.8.1_linux-5.8-native_write_cr4-export.patch"
	fi
	default
}

pkg_setup() {
	linux-mod_pkg_setup
	#compile against selected (not running) target
	BUILD_PARAMS="P_KVER=${KV_FULL} P_KERNEL=${KERNEL_DIR}"
}

pkg_postinst() {
	linux-mod_pkg_postinst
	einfo "\nUsage:"
	einfo "\n    ~$ modprobe p_lkrg p_init_log_level=3\n"
}
