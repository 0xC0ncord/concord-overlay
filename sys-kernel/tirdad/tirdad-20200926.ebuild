# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 linux-mod linux-info

DESCRIPTION="Kernel module for hot-patching randomized generation of TCP ISNs for IPv4"
HOMEPAGE="https://github.com/0xsirus/tirdad"
EGIT_REPO_URI="https://github.com/0xsirus/tirdad.git"
EGIT_COMMIT="9a0e137ae05dd1aa05c20750975598e4dac77dbf"
LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~amd64 ~x86"
IUSE=""

MODULE_NAMES="tirdad(misc:${S}:${S}/module)"
BUILD_TARGETS="clean all"

pkg_setup() {
	linux-mod_pkg_setup
	#compile against selected (not running) target
	BUILD_PARAMS="KERNELRELEASE=${KV_FULL} KERNELDIR=${KERNEL_DIR}"
}

pkg_postinst() {
	linux-mod_pkg_postinst
	einfo "\nUsage:"
	einfo "\n    ~$ modprobe tirdad\n"
}
