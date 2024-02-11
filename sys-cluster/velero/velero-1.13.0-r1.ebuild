# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 go-module

# git rev-parse HEAD
GIT_COMMIT=76670e940c52880a18dbbc59e3cbee7b94cd3352

DESCRIPTION="Backup and migrate Kubernetes applications and their persistent volumes"
HOMEPAGE="https://velero.io"
SRC_URI="https://github.com/vmware-tanzu/velero/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" https://dev.gentoo.org/~concord/distfiles/${P}-deps.tar.xz"

LICENSE="Apache-2.0 BSD BSD-2 CC0-1.0 ISC MIT MPL-2.0"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	export PKG="github.com/vmware-tanzu/velero"
	ego build -ldflags "
		-X ${PKG}/pkg/buildinfo.Version=${PV}
		-X ${PKG}/pkg/buildinfo.ImageRegistry=${PN}
		-X ${PKG}/pkg/buildinfo.GitSHA=${GIT_COMMIT}
		-X ${PKG}/pkg/buildinfo.GitTreeState=clean
		" -o ./bin/velero ${PKG}/cmd/velero
	ego build -ldflags "
		-X github.com/vmware-tanzu/velero/pkg/buildinfo.Version=${PV}
		-X github.com/vmware-tanzu/velero/pkg/buildinfo.ImageRegistry=${PN}
		-X github.com/vmware-tanzu/velero/pkg/buildinfo.GitSHA=${GIT_COMMIT}
		-X github.com/vmware-tanzu/velero/pkg/buildinfo.GitTreeState=clean
		" -o ./bin/velero-restore-helper ${PKG}/cmd/velero-restore-helper
}

src_install() {
	dobin ./bin/velero
	dobin ./bin/velero-restore-helper

	./bin/${PN} completion bash > ${PN}.bash || die
	newbashcomp ${PN}.bash ${PN}

	./bin/${PN} completion zsh > ${PN}.zsh || die
	insinto /usr/share/zsh/site-functions
	newins ${PN}.zsh _${PN}

	./bin/${PN} completion fish > ${PN}.fish || die
	insinto /usr/share/fish/vendor_completions.d
	newins ${PN}.fish ${PN}.fish

	dodoc -r changelogs examples README.md
}
