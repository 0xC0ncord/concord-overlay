# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/psy0rz/${PN}.git"
else
	SRC_URI="https://github.com/psy0rz/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

DESCRIPTION="Periodically backup ZFS filesystems to other locations"
HOMEPAGE="https://github.com/zfsonlinux/zfs-auto-snapshot"

LICENSE="GPL-3+"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/colorama[${PYTHON_USEDEP}]
	sys-fs/zfs
"

distutils_enable_tests unittest
