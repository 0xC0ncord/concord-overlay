# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module systemd

DESCRIPTION="Remote IPMI exporter for Prometheus"
HOMEPAGE="https://github.com/prometheus-community/ipmi_exporter"
SRC_URI="https://github.com/prometheus-community/ipmi_exporter/archive/v${PV}.tar.gz -> ${P}.tar.gz
https://dev.gentoo.org/~concord/distfiles/${P}-deps.tar.xz"

LICENSE="MIT Apache-2.0 BSD BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="acct-group/ipmi-exporter
	acct-user/ipmi-exporter
	app-admin/sudo
	sys-libs/freeipmi"

src_compile() {
	ego build
}

src_install() {
	dobin ${PN}
	dodoc README.md

	insinto /etc
	newins ipmi_local.yml ${PN}.yml

	# restrict permissions on config file as it may contain passwords
	fowners ipmi-exporter: /etc/${PN}.yml
	fperms 0600 /etc/${PN}.yml

	newinitd "${FILESDIR}"/${PN}.initd ${PN}
	systemd_dounit "${FILESDIR}"/${PN}.service

	insinto /etc/sudoers.d
	newins "${FILESDIR}"/${PN}-sudoers ${PN}

	insinto /usr/share/${PN}
	doins ipmi_local.yml
	doins ipmi_remote.yml
}
