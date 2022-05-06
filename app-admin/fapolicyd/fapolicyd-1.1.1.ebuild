# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools linux-info

DESCRIPTION="File Access Policy Daemon"
HOMEPAGE="https://github.com/linux-application-whitelisting/fapolicyd"
if [[ ${PV} == 9999 ]]; then
		EGIT_REPO_URI="https://github.com/linux-application-whitelisting/${PN}.git"
		inherit git-r3
else
		SRC_URI="https://github.com/linux-application-whitelisting/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
		KEYWORDS="~amd64"
fi

LICENSE="GPL-2+ GPL-3+ LGPL-3+"
SLOT="0"

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
		acct-user/fapolicyd"

CONFIG_CHECK="~FANOTIFY_ACCESS_PERMISSIONS"

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	local myconf=(
		$(use_with audit)
		$(use_with debug)
		$(use_with rpm)
		--disable-shared
	)
	econf "${myconf[@]}"
}

src_install() {
	# If not using rpm, remove rpm options from the default config
	if ! use rpm; then
		sed -i "init/${PN}.conf" -e '/^rpm_sha256_only/d' || die
		sed -i "init/${PN}.conf" -e '/^trust/s/.*/trust = file/' || die
	fi

	default

	fperms 0700 "/etc/${PN}"

	keepdir "/var/lib/${PN}"
	fowners -R "${PN}:${PN}" "/var/lib/${PN}"
	fperms 0700 "/var/lib/${PN}"
}
