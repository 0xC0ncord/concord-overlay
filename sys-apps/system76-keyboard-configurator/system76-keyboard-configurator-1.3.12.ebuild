# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	aho-corasick@1.1.2
	ansi_term@0.12.1
	approx@0.3.2
	arc-swap@1.6.0
	async-broadcast@0.5.1
	async-channel@1.9.0
	async-executor@1.6.0
	async-fs@1.6.0
	async-io@1.13.0
	async-lock@2.8.0
	async-process@1.8.1
	async-recursion@1.0.5
	async-signal@0.2.4
	async-task@4.4.1
	async-trait@0.1.74
	atk-sys@0.18.0
	atk@0.18.0
	atomic-waker@1.1.2
	atty@0.2.14
	autocfg@1.1.0
	bitflags@1.3.2
	bitflags@2.4.0
	block-buffer@0.10.4
	block@0.1.6
	blocking@1.4.1
	byteorder@1.5.0
	cairo-rs@0.18.5
	cairo-sys-rs@0.18.2
	cascade@1.0.1
	cc@1.0.83
	cfg-expr@0.15.5
	cfg-if@1.0.0
	clap@2.34.0
	concurrent-queue@2.3.0
	cpufeatures@0.2.9
	crossbeam-utils@0.8.16
	crypto-common@0.1.6
	dashmap@5.5.3
	derivative@2.2.0
	digest@0.10.7
	displaydoc@0.2.4
	downcast-rs@1.2.0
	enumflags2@0.7.8
	enumflags2_derive@0.7.8
	env_logger@0.10.0
	equivalent@1.0.1
	errno@0.3.5
	event-listener@2.5.3
	event-listener@3.0.0
	fastrand@1.9.0
	fastrand@2.0.1
	field-offset@0.3.6
	find-crate@0.6.3
	fluent-bundle@0.15.2
	fluent-langneg@0.13.0
	fluent-syntax@0.11.0
	fluent@0.16.0
	futures-channel@0.3.28
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-lite@1.13.0
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-timer@3.0.2
	futures-util@0.3.28
	futures@0.3.28
	gdk-pixbuf-sys@0.18.0
	gdk-pixbuf@0.18.5
	gdk-sys@0.18.0
	gdk@0.18.0
	generic-array@0.14.7
	getrandom@0.1.16
	getrandom@0.2.10
	gio-sys@0.18.1
	gio@0.18.4
	glib-build-tools@0.18.0
	glib-macros@0.18.5
	glib-sys@0.18.1
	glib@0.18.5
	gobject-sys@0.18.0
	gtk-sys@0.18.0
	gtk3-macros@0.18.0
	gtk@0.18.1
	hashbrown@0.14.1
	heck@0.4.1
	hermit-abi@0.1.19
	hermit-abi@0.3.3
	hex@0.4.3
	hidapi@1.5.0
	humantime@2.1.0
	i18n-config@0.4.6
	i18n-embed-fl@0.6.7
	i18n-embed-impl@0.8.2
	i18n-embed@0.13.9
	indexmap@2.0.2
	instant@0.1.12
	intl-memoizer@0.5.1
	intl_pluralrules@7.0.2
	io-lifetimes@1.0.11
	is-terminal@0.4.9
	itoa@1.0.9
	lazy_static@1.4.0
	libc@0.2.149
	linux-raw-sys@0.3.8
	linux-raw-sys@0.4.10
	locale_config@0.3.0
	lock_api@0.4.10
	log@0.4.20
	malloc_buf@0.0.6
	memchr@2.6.4
	memoffset@0.7.1
	memoffset@0.9.0
	nix@0.26.4
	num-traits@0.2.17
	num_cpus@1.16.0
	objc-foundation@0.1.1
	objc@0.2.7
	objc_id@0.1.1
	once_cell@1.18.0
	ordered-float@3.9.2
	ordered-stream@0.2.0
	palette@0.5.0
	palette_derive@0.5.0
	pango-sys@0.18.0
	pango@0.18.3
	pangocairo-sys@0.18.0
	pangocairo@0.18.0
	parking@2.1.1
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	phf@0.8.0
	phf_codegen@0.8.0
	phf_generator@0.8.0
	phf_shared@0.8.0
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	piper@0.2.1
	pkg-config@0.3.27
	polling@2.8.0
	ppv-lite86@0.2.17
	proc-macro-crate@1.3.1
	proc-macro-crate@2.0.1
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.69
	quote@1.0.33
	rand@0.7.3
	rand@0.8.5
	rand_chacha@0.2.2
	rand_chacha@0.3.1
	rand_core@0.5.1
	rand_core@0.6.4
	rand_hc@0.2.0
	rand_pcg@0.2.1
	redox_syscall@0.3.5
	redox_syscall@0.4.1
	regex-automata@0.4.1
	regex-syntax@0.8.0
	regex@1.10.0
	rust-embed-impl@6.8.1
	rust-embed-utils@7.8.1
	rust-embed@6.8.1
	rustc-hash@1.1.0
	rustc_version@0.4.0
	rustix@0.37.24
	rustix@0.38.18
	ryu@1.0.15
	same-file@1.0.6
	scopeguard@1.2.0
	self_cell@0.10.2
	semver@1.0.20
	serde@1.0.188
	serde_derive@1.0.188
	serde_json@1.0.107
	serde_repr@0.1.16
	serde_spanned@0.6.3
	sha1@0.10.6
	sha2@0.10.8
	signal-hook-registry@1.4.1
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.11.1
	socket2@0.4.9
	static_assertions@1.1.0
	strsim@0.10.0
	strsim@0.8.0
	syn@1.0.109
	syn@2.0.38
	system-deps@6.1.2
	system76_ectool@0.3.8
	target-lexicon@0.12.11
	tempfile@3.8.0
	termcolor@1.3.0
	textwrap@0.11.0
	thiserror-impl@1.0.49
	thiserror@1.0.49
	tinystr@0.7.4
	toml@0.5.11
	toml@0.8.2
	toml_datetime@0.6.3
	toml_edit@0.19.15
	toml_edit@0.20.2
	tracing-attributes@0.1.27
	tracing-core@0.1.31
	tracing@0.1.37
	type-map@0.4.0
	typenum@1.17.0
	uds_windows@1.0.2
	unic-langid-impl@0.9.1
	unic-langid@0.9.1
	unicode-ident@1.0.12
	unicode-width@0.1.11
	uuid@1.5.0
	vec_map@0.8.2
	version-compare@0.1.1
	version_check@0.9.4
	waker-fn@1.1.1
	walkdir@2.4.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.9.0+wasi-snapshot-preview1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.48.0
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.48.5
	winnow@0.5.16
	winreg@0.8.0
	xdg-home@1.0.0
	zbus@3.14.1
	zbus_macros@3.14.1
	zbus_names@2.6.0
	zvariant@3.15.0
	zvariant_derive@3.15.0
	zvariant_utils@1.0.1
"

inherit cargo desktop xdg

DESCRIPTION="Tool for configuring System76 keyboards"
HOMEPAGE="https://github.com/pop-os/keyboard-configurator"
SRC_URI="https://github.com/pop-os/keyboard-configurator/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" ${CARGO_CRATE_URIS}"

LICENSE="Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 Boost-1.0 GPL-3+ MIT Unlicense"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/hidapi
		x11-libs/gtk+:3
		virtual/libudev:="
RDEPEND="${DEPEND}"

# rust does not use *FLAGS from make.conf, silence portage warning
# update with proper path to binaries this crate installs, omit leading /
QA_FLAGS_IGNORED="usr/bin/${PN}"

XDG_ECLASS_DESKTOPFILES="linux/com.system76.keyboardconfigurator.desktop"

S="${WORKDIR}/keyboard-configurator-${PV}"

src_install() {
	cargo_src_install
	domenu linux/com.system76.keyboardconfigurator.desktop || die
	doicon -s scalable data/icons/scalable/apps/com.system76.keyboardconfigurator.svg || die
}
