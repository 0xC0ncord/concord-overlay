# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit go-module

DESCRIPTION="Simple and flexible tool for managing secrets"
HOMEPAGE="https://getsops.io https://github.com/getsops/sops"
SRC_URI="https://github.com/mozilla/sops/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://dev.gentoo.org/~concord/distfiles/${P}-deps.tar.xz"

LICENSE="Apache-2.0 BSD BSD-2 MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="hardened"

src_compile() {
	CGO_LDFLAGS="$(usex hardened '-fno-PIC ' '')" \
		ego build -o ./bin/"${PN}" ./cmd/"${PN}"
}

src_install() {
	dobin bin/"${PN}"
}
