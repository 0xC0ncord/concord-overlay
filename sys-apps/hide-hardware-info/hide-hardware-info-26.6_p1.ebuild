# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_PV="${PV/_p/-}"

DESCRIPTION="Hide hardware information to unprivileged users"
HOMEPAGE="https://github.com/Whonix/security-misc"
SRC_URI="https://github.com/Whonix/security-misc/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="app-shells/bash"
RDEPEND="${DEPEND}"

S="${WORKDIR}/security-misc-${MY_PV}"

src_compile(){
	true
}

src_install() {
	dobin usr/libexec/security-misc/hide-hardware-info

	newinitd "${FILESDIR}/hide-hardware-info.initd-r1" hide-hardware-info

	insinto /lib/systemd/system
	sed -i 's|^ExecStart=.*|ExecStart=/usr/bin/hide-hardware-info|' \
		lib/systemd/system/hide-hardware-info.service || die
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
