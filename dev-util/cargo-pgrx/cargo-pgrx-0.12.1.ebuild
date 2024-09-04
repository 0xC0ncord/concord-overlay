# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Auto-Generated by cargo-ebuild 0.5.4-r1

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	aho-corasick@1.1.2
	anstream@0.6.11
	anstyle@1.0.4
	anstyle-parse@0.2.3
	anstyle-query@1.0.2
	anstyle-wincon@3.0.2
	anyhow@1.0.79
	async-trait@0.1.77
	atomic-traits@0.3.0
	atty@0.2.14
	autocfg@1.1.0
	backtrace@0.3.69
	base64@0.21.7
	basic-toml@0.1.8
	bincode@1.3.3
	bindgen@0.69.4
	bit-set@0.5.3
	bit-vec@0.6.3
	bitflags@1.3.2
	bitflags@2.4.2
	bitvec@1.0.1
	block-buffer@0.10.4
	bumpalo@3.14.0
	byteorder@1.5.0
	bytes@1.5.0
	bzip2@0.4.4
	bzip2-sys@0.1.11+1.0.8
	camino@1.1.6
	cargo-edit@0.12.2
	cargo-platform@0.1.6
	cargo_metadata@0.15.4
	cargo_metadata@0.18.1
	cargo_toml@0.19.1
	cc@1.0.83
	cee-scape@0.2.0
	cexpr@0.6.0
	cfg-if@1.0.0
	clang-sys@1.7.0
	clap@4.4.18
	clap-cargo@0.12.0
	clap-cargo@0.14.0
	clap_builder@4.4.18
	clap_derive@4.4.7
	clap_lex@0.6.0
	color-eyre@0.6.2
	color-spantrace@0.2.1
	colorchoice@1.0.0
	concolor-control@0.0.7
	concolor-query@0.0.4
	convert_case@0.6.0
	core-foundation@0.9.4
	core-foundation-sys@0.8.6
	cpufeatures@0.2.12
	crates-index@0.19.13
	crc32fast@1.3.2
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	crypto-common@0.1.6
	deranged@0.3.11
	digest@0.10.7
	dunce@1.0.4
	either@1.9.0
	enum-map@2.7.3
	enum-map-derive@0.17.0
	env_proxy@0.4.1
	equivalent@1.0.1
	errno@0.3.8
	eyre@0.6.12
	fallible-iterator@0.2.0
	fancy-regex@0.11.0
	fastrand@2.0.1
	filetime@0.2.23
	finl_unicode@1.2.0
	fixedbitset@0.4.2
	flate2@1.0.28
	fnv@1.0.7
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.2.1
	funty@2.0.0
	futures-channel@0.3.30
	futures-core@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	getrandom@0.2.12
	gimli@0.28.1
	git2@0.17.2
	glob@0.3.1
	half@1.8.2
	hash32@0.3.1
	hashbrown@0.12.3
	hashbrown@0.14.3
	heapless@0.8.0
	heck@0.4.1
	hermit-abi@0.1.19
	hermit-abi@0.3.9
	hex@0.4.3
	hmac@0.12.1
	home@0.5.9
	idna@0.5.0
	indenter@0.3.3
	indexmap@1.9.3
	indexmap@2.1.0
	is-terminal@0.4.12
	is_ci@1.1.1
	itertools@0.12.1
	itoa@1.0.11
	jobserver@0.1.31
	jobslot@0.2.14
	js-sys@0.3.67
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.155
	libgit2-sys@0.15.2+1.6.4
	libloading@0.8.1
	libm@0.2.8
	libssh2-sys@0.3.0
	libz-sys@1.1.16
	line-wrap@0.1.1
	linked-hash-map@0.5.6
	linux-raw-sys@0.4.13
	lock_api@0.4.11
	log@0.4.20
	matchers@0.1.0
	md-5@0.10.6
	memchr@2.7.1
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.10
	native-tls@0.2.11
	nom@7.1.3
	ntapi@0.4.1
	nu-ansi-term@0.46.0
	num-traits@0.2.17
	object@0.32.2
	once_cell@1.19.0
	openssl@0.10.63
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.99
	overload@0.1.1
	owo-colors@3.5.0
	owo-colors@4.0.0
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	paste@1.0.14
	pathdiff@0.2.1
	pathsearch@0.2.0
	percent-encoding@2.3.1
	pest@2.7.6
	petgraph@0.6.4
	phf@0.11.2
	phf_shared@0.11.2
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pkg-config@0.3.29
	plist@1.6.0
	postgres@0.19.7
	postgres-protocol@0.6.6
	postgres-types@0.2.6
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	proc-macro2@1.0.83
	proptest@1.4.0
	quick-error@1.2.3
	quick-xml@0.31.0
	quote@1.0.36
	radium@0.7.0
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_xorshift@0.3.0
	rayon@1.8.1
	rayon-core@1.12.1
	redox_syscall@0.4.1
	regex@1.10.3
	regex-automata@0.1.10
	regex-automata@0.4.5
	regex-syntax@0.6.29
	regex-syntax@0.7.5
	regex-syntax@0.8.2
	ring@0.17.7
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustc_version@0.3.3
	rustix@0.38.30
	rustls@0.21.10
	rustls-native-certs@0.6.3
	rustls-pemfile@1.0.4
	rustls-webpki@0.101.7
	rusty-fork@0.3.0
	ryu@1.0.18
	safemem@0.3.3
	same-file@1.0.6
	schannel@0.1.23
	scopeguard@1.2.0
	sct@0.7.1
	seahash@4.1.0
	security-framework@2.9.2
	security-framework-sys@2.9.1
	semver@0.11.0
	semver@1.0.21
	semver-parser@0.10.2
	serde@1.0.202
	serde-xml-rs@0.6.0
	serde_cbor@0.11.2
	serde_derive@1.0.202
	serde_json@1.0.117
	serde_spanned@0.6.5
	sha2@0.10.8
	sharded-slab@0.1.7
	shlex@1.3.0
	siphasher@0.3.11
	slab@0.4.9
	smallvec@1.13.1
	smol_str@0.2.1
	socket2@0.5.5
	socks@0.3.4
	spin@0.9.8
	sptr@0.3.2
	stable_deref_trait@1.2.0
	stringprep@0.1.4
	strsim@0.10.0
	subprocess@0.2.9
	subtle@2.5.0
	supports-color@2.1.0
	syn@2.0.65
	syntect@5.1.0
	sysinfo@0.30.12
	tap@1.0.1
	tar@0.4.40
	tempfile@3.9.0
	termcolor@1.4.1
	terminal_size@0.3.0
	thiserror@1.0.56
	thiserror-impl@1.0.56
	thread_local@1.1.7
	time@0.3.31
	time-core@0.1.2
	time-macros@0.2.16
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.35.1
	tokio-postgres@0.7.10
	tokio-util@0.7.10
	toml@0.7.8
	toml@0.8.10
	toml_datetime@0.6.5
	toml_edit@0.19.15
	toml_edit@0.22.12
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-error@0.2.0
	tracing-log@0.2.0
	tracing-subscriber@0.3.18
	trybuild@1.0.89
	typenum@1.17.0
	ucd-trie@0.1.6
	unarray@0.1.4
	unescape@0.1.0
	unicode-bidi@0.3.15
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	untrusted@0.9.0
	ureq@2.8.0
	url@2.5.0
	utf8parse@0.2.1
	uuid@1.7.0
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	wait-timeout@0.2.0
	walkdir@2.4.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasite@0.1.0
	wasm-bindgen@0.2.90
	wasm-bindgen-backend@0.2.90
	wasm-bindgen-macro@0.2.90
	wasm-bindgen-macro-support@0.2.90
	wasm-bindgen-shared@0.2.90
	web-sys@0.3.67
	webpki-roots@0.25.3
	whoami@1.5.1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.52.0
	windows-core@0.52.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.0
	winnow@0.5.40
	winnow@0.6.5
	wyz@0.5.1
	xattr@1.3.1
	xml-rs@0.8.19
	yaml-rust@0.4.5
"

inherit cargo

MY_PN="${PN//cargo-}"

DESCRIPTION="A Rust framework for creating Postgres extensions"
HOMEPAGE="https://github.com/pgcentralfoundation/pgrx"
SRC_URI="https://github.com/pgcentralfoundation/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" ${CARGO_CRATE_URIS}"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 CC0-1.0 ISC MIT MIT-0 MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_PN}-${PV}"

QA_FLAGS_IGNORED="usr/bin/${PN}"

src_compile() {
	cargo_src_compile -p "${PN}"
}

src_install() {
	dobin "$(cargo_target_dir)"/"${PN}"
}