# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit linux-mod

DESCRIPTION="Linux Kernel Runtime Guard"
HOMEPAGE="https://www.openwall.com/lkrg/"
if [[ "${PV}" == "9999" ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/openwall/${PN}.git"
	EGIT_BRANCH="main"
	KEYWORDS=""
else
	SRC_URI="https://www.openwall.com/lkrg/${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi
LICENSE="GPL-3"
SLOT="0"

IUSE=""

MODULE_NAMES="p_lkrg(misc:${S}:${S})"
BUILD_TARGETS="clean all"
CONFIG_CHECK="
	JUMP_LABEL

	MODULES MODULE_UNLOAD
	KPROBES
	KALLSYMS_ALL
"

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
