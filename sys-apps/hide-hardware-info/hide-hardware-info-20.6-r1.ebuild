# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PV="20.6-1"
DESCRIPTION="Hide hardware information to unprivileged users"
HOMEPAGE="https://github.com/Whonix/security-misc"
SRC_URI="https://github.com/Whonix/security-misc/archive/${MY_PV}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

PATCHES="${FILESDIR}/hide-hardware-info-unit-exec-location.patch"

S="${WORKDIR}/security-misc-${MY_PV}"

src_compile(){
	true
}

src_install() {
	dobin usr/lib/security-misc/hide-hardware-info

	newinitd "${FILESDIR}/hide-hardware-info.initd-r1" hide-hardware-info

	insinto /lib/systemd/system
	doins lib/systemd/system/hide-hardware-info.service

	insinto /etc
	doins -r etc/hide-hardware-info.d
}

pkg_postinst() {
	einfo "NOTE: By default, hide-hardware-info allows read access to sysfs and cpuinfo"
	einfo "to the sysfs and cpuinfo groups only, if the whitelists are enabled (default)."
	einfo "These groups probably don't exist on your system, and so hide-hardware-info"
	einfo "will not work out of the box. You must either create these groups manually"
	einfo "and add the desired users to them, or disable the whitelists by editing files"
	einfo "in /etc/hide-hardware-info.d."
}
