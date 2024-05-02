# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1 systemd verify-sig

DESCRIPTION="Linux Kernel Runtime Guard"
HOMEPAGE="https://lkrg.org"

EGIT_REPO_URI="https://github.com/lkrg-org/${PN}.git"
inherit git-r3

LICENSE="GPL-2"
SLOT="0"

# MODULE_NAMES="lkrg(misc:${S}:${S})"

PATCHES=( "${FILESDIR}/${PN}-0.9.4-gentoo-paths.patch" )

pkg_setup() {
	CONFIG_CHECK="HAVE_KRETPROBES KALLSYMS_ALL KPROBES JUMP_LABEL"
	CONFIG_CHECK+=" MODULE_UNLOAD !PREEMPT_RT ~STACKTRACE"
	linux-mod-r1_pkg_setup
}

src_compile() {
	local modlist=( lkrg )
	local modargs=(
		P_KVER="${KV_FULL}"
		P_KERNEL="${KERNEL_DIR}"
	)
	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install

	systemd_dounit scripts/bootup/systemd/lkrg.service
	newinitd scripts/bootup/openrc/lkrg lkrg.initd

	insinto /lib/sysctl.d
	newins scripts/bootup/lkrg.conf 01-lkrg.conf
}
