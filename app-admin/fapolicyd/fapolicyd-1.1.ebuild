# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit autotools linux-info systemd

DESCRIPTION="File Access Policy Daemon"
HOMEPAGE="https://github.com/linux-application-whitelisting/fapolicyd"
if [[ ${PV} == 9999 ]]; then
		EGIT_REPO_URI="https://github.com/linux-application-whitelisting/fapolicyd.git"
		inherit git-r3
else
		SRC_URI="https://github.com/linux-application-whitelisting/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+audit debug rpm"

DEPEND="dev-db/lmdb
		dev-libs/libgcrypt
		sys-libs/libseccomp
		dev-libs/uthash
		sys-apps/file
		sys-libs/libcap-ng
		sys-kernel/linux-headers
		virtual/libudev"
RDEPEND="${DEPEND}
		acct-user/fapolicyd
		dev-lang/python:*
		>=sys-apps/systemd-217"

CONFIG_CHECK="~FANOTIFY_ACCESS_PERMISSIONS"

src_configure() {
	eautoreconf
	econf \
		$(use_with audit) \
		$(use_with debug) \
		$(use_with rpm)
}

src_install() {
	dosbin src/fapolicyd
	dosbin src/fapolicyd-cli
	dosbin init/fagenrules

	systemd_newunit init/fapolicyd.service fapolicyd.service

	insinto /usr/share/fapolicyd
	doins init/fapolicyd-magic.mgc

	if ! use rpm; then
		sed -i init/fapolicyd.conf -e '/^rpm_sha256_only/d'
		sed -i init/fapolicyd.conf -e '/^trust/s/.*/trust = file/'
	fi

	insinto /etc/fapolicyd
	doins init/fapolicyd.conf
	doins init/fapolicyd.trust
	fperms 0700 /etc/fapolicyd

	insinto /etc/fapolicyd/rules.d
	doins rules.d/*.rules

	keepdir /var/lib/fapolicyd
	fowners -R fapolicyd:fapolicyd /var/lib/fapolicyd
	fperms 0700 /var/lib/fapolicyd

	dodoc AUTHORS
	dodoc ChangeLog
	dodoc NEWS
	dodoc README.md

	doman doc/fapolicyd.8
	doman doc/fapolicyd-cli.1
	doman doc/fapolicyd.conf.5
	doman doc/fapolicyd.rules.5
	doman doc/fapolicyd.trust.5
}
