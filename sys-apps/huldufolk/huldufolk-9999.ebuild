# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.4.0

EAPI=8

CRATES="
	capabilities-0.3.0
	libc-0.2.79
	proc-macro2-1.0.24
	quote-1.0.7
	serde-1.0.116
	serde_derive-1.0.116
	syn-1.0.43
	toml-0.4.10
	unicode-xid-0.2.1
"

inherit cargo git-r3

DESCRIPTION="Implementation of the userspace side of Linux's CONFIG_STATIC_USERMODEHELPER"
HOMEPAGE="https://github.com/tych0/huldufolk"
SRC_URI="$(cargo_crate_uris)"
EGIT_REPO_URI="https://github.com/tych0/${PN}.git"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS=""

src_unpack() {
	git-r3_fetch
	git-r3_checkout
	cargo_src_unpack
}

src_configure() {
	cargo_gen_config
	mkdir "${WORKDIR}"/cargo_home/gentoo
	cargo_src_configure
}

src_install() {
	into /
	dosbin target/release/usermode-helper

	insinto /etc
	mv sample-usermode-helper.toml usermode-helper.conf
	doins usermode-helper.conf
}
