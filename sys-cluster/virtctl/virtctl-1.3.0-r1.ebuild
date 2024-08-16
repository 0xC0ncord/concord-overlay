# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 go-module

# git rev-parse HEAD
MY_GIT_COMMIT=e8e638edc22587ec7be2cc3d983b61763e33f973

MY_PN="kubevirt"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Control virtual machine related operations on your kubernetes cluster"
HOMEPAGE="https://kubevirt.io https://github.com/kubevirt/kubevirt"
SRC_URI="https://github.com/kubevirt/kubevirt/archive/v${PV}.tar.gz -> ${MY_P}.tar.gz"
SRC_URI+=" https://dev.gentoo.org/~concord/distfiles/${MY_P}-deps.tar.xz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_P}"

src_compile() {
	ego build -o ./bin/virtctl -ldflags "
		-X kubevirt.io/client-go/version.buildDate=$(date -u +'%Y-%m-%dT%H:%M:%SZ')
		-X kubevirt.io/client-go/version.gitCommit=${MY_GIT_COMMIT}
		-X kubevirt.io/client-go/version.gitTreeState=clean
		-X kubevirt.io/client-go/version.gitVersion=v${PV}
		" ./cmd/virtctl
}

src_install() {
	dobin bin/virtctl

	bin/virtctl completion bash >./virtctl.bash || die
	newbashcomp ./virtctl.bash virtctl

	bin/virtctl completion zsh >./virtctl.zsh || die
	insinto /usr/share/zsh/site-functions
	newins ./virtctl.zsh _virtctl
}
