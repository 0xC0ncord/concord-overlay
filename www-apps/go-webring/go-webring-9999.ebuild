# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

EGO_SUM=(
	"github.com/spf13/pflag v1.0.5"
	"github.com/spf13/pflag v1.0.5/go.mod"
)

go-module_set_globals

DESCRIPTION="Simple webring implementation created for the Fediring"
HOMEPAGE="https://git.sr.ht/~amolith/go-webring"
if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://git.sr.ht/~amolith/${PN}"
	inherit git-r3
fi
SRC_URI="${EGO_SUM_SRC_URI}"

LICENSE="BSD-2 BSD-3 CC0-1.0"
SLOT="0"
KEYWORDS=""
IUSE=""

src_unpack() {
	if [[ ${PV} == 9999 ]]; then
		git-r3_src_unpack
	else
		default
	fi
	go-module_src_unpack
}

src_install() {
	dobin out/go-webring
}
