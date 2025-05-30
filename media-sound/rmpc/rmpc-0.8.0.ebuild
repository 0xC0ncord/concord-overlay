# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Autogenerated by pycargoebuild 0.15.0

EAPI=8

CRATES="
	adler2@2.0.0
	aho-corasick@1.1.3
	aligned-vec@0.5.0
	allocator-api2@0.2.21
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.6
	anstyle@1.0.10
	anyhow@1.0.95
	arbitrary@1.4.1
	arg_enum_proc_macro@0.3.4
	arrayvec@0.7.6
	autocfg@1.4.0
	av1-grain@0.2.3
	avif-serialize@0.8.2
	base64@0.21.7
	base64@0.22.1
	bit_field@0.10.2
	bitflags@1.3.2
	bitflags@2.8.0
	bitstream-io@2.6.0
	bon-macros@3.3.2
	bon@3.3.2
	built@0.7.5
	bumpalo@3.16.0
	bytemuck@1.20.0
	byteorder-lite@0.1.0
	byteorder@1.5.0
	cassowary@0.3.0
	castaway@0.2.3
	cc@1.2.2
	cfg-expr@0.15.8
	cfg-if@1.0.0
	chrono@0.4.39
	clap@4.5.27
	clap_builder@4.5.27
	clap_complete@4.5.42
	clap_derive@4.5.24
	clap_lex@0.7.4
	clap_mangen@0.2.26
	color_quant@1.1.0
	colorchoice@1.0.3
	compact_str@0.8.0
	core-foundation-sys@0.8.7
	crc32fast@1.4.2
	crossbeam-channel@0.5.13
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.20
	crossbeam@0.8.4
	crossterm@0.28.1
	crossterm_winapi@0.9.1
	crunchy@0.2.2
	darling@0.20.10
	darling_core@0.20.10
	darling_macro@0.20.10
	deranged@0.3.11
	derive_builder@0.20.2
	derive_builder_core@0.20.2
	derive_builder_macro@0.20.2
	derive_more-impl@1.0.0
	derive_more@1.0.0
	diff@0.1.13
	displaydoc@0.2.5
	either@1.13.0
	enum-map-derive@0.17.0
	enum-map@2.7.3
	env_home@0.1.0
	equivalent@1.0.1
	errno@0.3.10
	exr@1.73.0
	fdeflate@0.3.7
	flate2@1.0.35
	flexi_logger@0.29.8
	fnv@1.0.7
	foldhash@0.1.3
	form_urlencoded@1.2.1
	futures-core@0.3.31
	futures-macro@0.3.31
	futures-task@0.3.31
	futures-timer@3.0.3
	futures-util@0.3.31
	getrandom@0.2.15
	gif@0.13.1
	glob@0.3.1
	half@2.4.1
	hashbrown@0.12.3
	hashbrown@0.15.2
	heck@0.5.0
	hex@0.4.3
	iana-time-zone-haiku@0.1.2
	iana-time-zone@0.1.61
	icu_collections@1.5.0
	icu_locid@1.5.0
	icu_locid_transform@1.5.0
	icu_locid_transform_data@1.5.0
	icu_normalizer@1.5.0
	icu_normalizer_data@1.5.0
	icu_properties@1.5.1
	icu_properties_data@1.5.0
	icu_provider@1.5.0
	icu_provider_macros@1.5.0
	ident_case@1.0.1
	idna@1.0.3
	idna_adapter@1.2.0
	image-webp@0.2.0
	image@0.25.5
	imgref@1.11.0
	indexmap@1.9.3
	indexmap@2.7.0
	indoc@2.0.5
	instability@0.3.3
	interpolate_name@0.2.4
	is_terminal_polyfill@1.70.1
	itertools@0.12.1
	itertools@0.13.0
	itertools@0.14.0
	itoa@1.0.14
	jobserver@0.1.32
	jpeg-decoder@0.3.1
	js-sys@0.3.74
	lebe@0.5.2
	libc@0.2.167
	libfuzzer-sys@0.4.8
	linux-raw-sys@0.4.14
	litemap@0.7.4
	lock_api@0.4.12
	log@0.4.25
	loop9@0.1.5
	lru@0.12.5
	maybe-rayon@0.1.1
	memchr@2.7.4
	minimal-lexical@0.2.1
	miniz_oxide@0.8.0
	mio@1.0.3
	new_debug_unreachable@1.0.6
	nom@7.1.3
	noop_proc_macro@0.3.0
	ntapi@0.4.1
	nu-ansi-term@0.50.1
	num-bigint@0.4.6
	num-conv@0.1.0
	num-derive@0.4.2
	num-integer@0.1.46
	num-rational@0.4.2
	num-traits@0.2.19
	num_threads@0.1.7
	once_cell@1.20.2
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	paste@1.0.15
	percent-encoding@2.3.1
	pin-project-lite@0.2.15
	pin-utils@0.1.0
	pkg-config@0.3.31
	png@0.17.14
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	pretty_assertions@1.4.1
	prettyplease@0.2.25
	proc-macro-crate@3.2.0
	proc-macro2@1.0.92
	profiling-procmacros@1.0.16
	profiling@1.0.16
	qoi@0.4.1
	quick-error@2.0.1
	quote@1.0.37
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	ratatui@0.29.0
	rav1e@0.7.1
	ravif@0.11.11
	rayon-core@1.12.1
	rayon@1.10.0
	redox_syscall@0.5.7
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	relative-path@1.9.3
	rgb@0.8.50
	roff@0.2.2
	ron@0.8.1
	rstest@0.24.0
	rstest_macros@0.24.0
	rustc_version@0.4.1
	rustix@0.38.44
	rustversion@1.0.19
	ryu@1.0.18
	same-file@1.0.6
	scopeguard@1.2.0
	semver@1.0.23
	serde@1.0.217
	serde_derive@1.0.217
	serde_json@1.0.137
	serde_spanned@0.6.8
	serde_with@3.12.0
	serde_with_macros@3.12.0
	shlex@1.3.0
	signal-hook-mio@0.2.4
	signal-hook-registry@1.4.2
	signal-hook@0.3.17
	simd-adler32@0.3.7
	simd_helpers@0.1.0
	slab@0.4.9
	smallvec@1.13.2
	smawk@0.3.2
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	strsim@0.11.1
	strum@0.26.3
	strum_macros@0.26.4
	syn@2.0.90
	synstructure@0.13.1
	sysinfo@0.33.1
	system-deps@6.2.2
	target-lexicon@0.12.16
	test-case-core@3.3.1
	test-case-macros@3.3.1
	test-case@3.3.1
	textwrap@0.16.1
	thiserror-impl@1.0.69
	thiserror-impl@2.0.11
	thiserror@1.0.69
	thiserror@2.0.11
	tiff@0.9.1
	time-core@0.1.2
	time-macros@0.2.19
	time@0.3.37
	tinystr@0.7.6
	toml@0.8.19
	toml_datetime@0.6.8
	toml_edit@0.22.22
	unicode-ident@1.0.14
	unicode-linebreak@0.1.5
	unicode-segmentation@1.12.0
	unicode-truncate@1.1.0
	unicode-width@0.1.14
	unicode-width@0.2.0
	unicode-xid@0.2.6
	url@2.5.4
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.2
	v_frame@0.3.8
	vergen-gitcl@1.0.5
	vergen-lib@0.1.6
	vergen@9.0.4
	version-compare@0.2.0
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.97
	wasm-bindgen-macro-support@0.2.97
	wasm-bindgen-macro@0.2.97
	wasm-bindgen-shared@0.2.97
	wasm-bindgen@0.2.97
	weezl@0.1.8
	which@7.0.1
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-core@0.57.0
	windows-implement@0.57.0
	windows-interface@0.57.0
	windows-result@0.1.2
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows@0.57.0
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.52.6
	winnow@0.6.20
	winsafe@0.0.19
	write16@1.0.0
	writeable@0.5.5
	yansi@1.0.1
	yoke-derive@0.7.5
	yoke@0.7.5
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zerofrom-derive@0.1.5
	zerofrom@0.1.5
	zerovec-derive@0.10.3
	zerovec@0.10.4
	zune-core@0.4.12
	zune-inflate@0.2.54
	zune-jpeg@0.4.13
"

inherit cargo

DESCRIPTION="A beautiful and configurable TUI client for MPD"
HOMEPAGE="https://mierak.github.io/rmpc https://github.com/mierak/rmpc"
SRC_URI="
	https://github.com/mierak/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"

LICENSE="BSD"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD-2 BSD MIT Unicode-3.0
	ZLIB
"
SLOT="0"
KEYWORDS="~amd64"
