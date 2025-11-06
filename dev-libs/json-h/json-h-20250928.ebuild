# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

MY_GIT_COMMIT=269baa8c5f4ae331982b3bde55fad2ae4f0bd17d
MY_PN="json.h"

DESCRIPTION="Single header json parser for C and C++"
HOMEPAGE="https://github.com/sheredom/json.h"
SRC_URI="https://github.com/sheredom/${MY_PN}/archive/${MY_GIT_COMMIT}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${MY_PN}-${MY_GIT_COMMIT}"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
	true
}

src_install() {
	doheader json.h
}
