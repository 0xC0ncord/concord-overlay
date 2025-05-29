# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit desktop udev xdg

DESCRIPTION="Drivers for XP Pen drawing tablets"
HOMEPAGE="https://www.xp-pen.com"
SRC_URI="XPPenLinux${PV}-250117.tar.gz"
RESTRICT="fetch"

S="${WORKDIR}/${SRC_URI//.tar.gz}"

LICENSE="proprietary"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	insinto /etc/xdg/autostart
	doins App/etc/xdg/autostart/xppentablet.desktop

	udev_dorules App/lib/udev/rules.d/10-xp-pen.rules

	insinto /usr/lib
	doins -r App/usr/lib/pentablet
	fperms +x /usr/lib/pentablet/PenTablet{,.sh}
	# why?
	fperms 0777 /usr/lib/pentablet/conf/xppen
	fperms 0666 /usr/lib/pentablet/conf/xppen/{config.xml,language.ini,name_config.ini,dialogpos.ini}

	doicon -s 256 App/usr/share/icons/hicolor/256x256/apps/xppentablet.png
	domenu App/usr/share/applications/xppentablet.desktop
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
