# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="API traffic viewer for kubernetes"
HOMEPAGE="https://github.com/kubeshark/kubeshark"
SRC_URI="https://github.com/kubeshark/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://dev.gentoo.org/~concord/distfiles/${P}-deps.tar.xz"

KEYWORDS="~amd64"

LICENSE="Apache-2.0 BSD BSD-2 ISC MIT"
SLOT="0"

DEPEND=""
RDEPEND="${DEPEND}"

S="${S}/cli"

src_compile() {
	ego build -ldflags="-s -w -X 'github.com/kubeshark/kubeshark/cli/kubeshark.Ver=${PV}'" \
		-o bin/kubeshark kubeshark.go
}

src_install() {
	dobin bin/kubeshark
}
