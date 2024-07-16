# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 go-module

MY_PN="noobaa-operator"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Object data service for hybrid and multi cloud environments"
HOMEPAGE="https://www.noobaa.io https://github.com/noobaa/noobaa-operator"
SRC_URI="https://github.com/noobaa/noobaa-operator/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"
SRC_URI+=" https://dev.gentoo.org/~concord/distfiles/${MY_P}-deps.tar.xz"

LICENSE="Apache-2.0 BSD BSD-2 ISC MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_P}"

src_compile() {
	ego build -o ./bin/noobaa-operator-local cmd/manager/main.go
}

src_install() {
	newbin ./bin/noobaa-operator-local noobaa

	./bin/noobaa-operator-local completion >noobaa.bash || die
	newbashcomp noobaa.bash noobaa

	dodoc -r doc README.md
}
