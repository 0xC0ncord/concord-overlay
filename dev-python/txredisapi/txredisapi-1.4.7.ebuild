# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )
inherit distutils-r1

DESCRIPTION="Non-blocking redis client for python"
HOMEPAGE="https://github.com/IlyaSkriblovsky/txredisapi https://pypi.org/project/txredisapi/"
SRC_URI="https://github.com/IlyaSkriblovsky/txredisapi/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
		dev-python/six[${PYTHON_USEDEP}]
		dev-python/twisted[${PYTHON_USEDEP}]
"
