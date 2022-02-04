# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..10} )
inherit distutils-r1

DESCRIPTION="A tool for generating SELinux security profiles for containers"
HOMEPAGE="https://github.com/containers/udica"
SRC_URI="https://github.com/containers/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

python_install_all() {
	distutils-r1_python_install_all
	doman "${PN}/man/man8/${PN}.8"
}
