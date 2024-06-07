# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
inherit distutils-r1

DESCRIPTION="A tool for generating SELinux security profiles for containers"
HOMEPAGE="https://github.com/containers/udica"
SRC_URI="https://github.com/containers/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

python_install_all() {
	distutils-r1_python_install_all

	# Remove sample ansible playbook; it assumes we are using container-selinux
	# which is not supported on refpolicy
	rm -rf "${ED}/usr/share/udica" || die

	# Remove unnecessary copy of GPL-3 license that gets installed
	rm -rf "${ED}/usr/share/licenses" || die

	doman "${PN}/man/man8/${PN}.8"
}
