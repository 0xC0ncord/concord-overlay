# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit bash-completion-r1 go-module

DESCRIPTION="Multi pod and container log tailing for Kubernetes"
HOMEPAGE="https://github.com/stern/stern"
SRC_URI="https://github.com/stern/stern/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://dev.gentoo.org/~concord/distfiles/stern-${PV}-deps.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE="hardened"

BDEPEND=">=dev-lang/go-1.19"

src_compile() {
	CGO_LDFLAGS="$(usex hardened '-fno-PIC ' '')" \
		ego build -ldflags="-s -w" -o ./dist/${PN} .
}

src_install() {
	dobin dist/${PN}

	dist/${PN} --completion bash > ${PN}.bash || die
	newbashcomp ${PN}.bash ${PN}

	dist/${PN} --completion zsh > ${PN}.zsh || die
	insinto /usr/share/zsh/site-functions
	newins ${PN}.zsh _${PN}

	dist/${PN} --completion fish > ${PN}.fish || die
	insinto /usr/share/fish/vendor_completions.d
	newins ${PN}.fish ${PN}.fish
}
