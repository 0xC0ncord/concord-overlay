# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A pass extension to help keep the tree of passwords encrypted inside a tomb"
HOMEPAGE="https://github.com/roddhjav/pass-tomb"
SRC_URI="https://github.com/roddhjav/pass-tomb/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bash-completion zsh-completion"

DEPEND=">=app-admin/pass-1.7.0
	>=app-crypt/tomb-2.4"
RDEPEND="${DEPEND}"

PATCHES="${FILESDIR}/${P}-gentoo.patch"

src_compile(){
	true
}

src_install() {
	default

	if use bash-completion ; then
		insinto /etc/bash_completion.d
		doins completion/${PN}.bash
	fi
	if use zsh-completion ; then
		mv completion/${PN}.zsh completion/_${PN}.zsh
		mv completion/pass-open.zsh completion/_pass-open.zsh
		mv completion/pass-close.zsh completion/_pass-close.zsh

		insinto /usr/share/zsh/site-functions
		doins completion/_${PN}.zsh
		doins completion/_pass-open.zsh
		doins completion/_pass-close.zsh
	fi
}

pkg_postinst() {
	einfo "NOTE: In order to use the timer feature, you must be using a systemd-based system."
}
