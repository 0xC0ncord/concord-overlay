# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1

MY_PN="${PN//-bin}"

DESCRIPTION="OAuth credential Manager"
HOMEPAGE="https://github.com/pdobsan/oama"
BASE_URI="https://github.com/pdobsan/oama/releases/download/${PV}"
SRC_URI="
	amd64? ( ${BASE_URI}/${P//-bin}-Linux-x86_64.tgz )
	aarch64? ( ${BASE_URI}/${P//-bin}-Linux-aarch64.tgz )
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${DEPEND}"

case ${ARCH} in
	amd64)
		S="${WORKDIR}/${P//-bin}-Linux-x86_64"
		;;
	aarch64)
		S="${WORKDIR}/${P//-bin}-Linux-aarch64"
		;;
	*)
		die "Unsupported arch ${ARCH}"
		;;
esac

src_install() {
	dobin ${MY_PN}

	newbashcomp completions/${MY_PN}.bash ${MY_PN}

	insinto /usr/share/zsh/site-functions
	newins completions/${MY_PN}.zsh _${MY_PN}

	insinto /usr/share/fish/vendor_completions.d
	newins completions/${MY_PN}.fish ${MY_PN}.fish
}
