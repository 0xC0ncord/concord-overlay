# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.21.0
	adler@1.0.2
	ahash@0.7.7
	ahash@0.8.6
	aho-corasick@1.1.2
	allocator-api2@0.2.16
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anes@0.1.6
	anstream@0.6.4
	anstyle@1.0.4
	anstyle-parse@0.2.2
	anstyle-query@1.0.0
	anstyle-wincon@3.0.1
	anymap2@0.13.0
	arc-swap@1.6.0
	argon2@0.5.2
	asn1-rs@0.3.1
	asn1-rs-derive@0.1.0
	asn1-rs-impl@0.1.0
	assert_cmd@2.0.12
	async-compression@0.4.4
	async-recursion@1.0.5
	async-stream@0.3.5
	async-stream-impl@0.3.5
	async-trait@0.1.74
	authenticator-ctap2-2021@0.3.2-dev.1
	autocfg@1.1.0
	axum@0.6.20
	axum-auth@0.4.1
	axum-core@0.3.4
	axum-csp@0.0.5
	axum-macros@0.3.8
	axum-server@0.5.1
	backtrace@0.3.69
	base32@0.4.0
	base64@0.12.3
	base64@0.13.1
	base64@0.21.5
	base64ct@1.6.0
	bincode@1.3.3
	bindgen@0.66.1
	bit-set@0.5.3
	bit-vec@0.6.3
	bitfield@0.14.0
	bitflags@1.3.2
	bitflags@2.4.1
	blake2@0.10.6
	block-buffer@0.7.3
	block-buffer@0.10.4
	block-padding@0.1.5
	boolinator@2.4.0
	bstr@1.7.0
	btoi@0.4.3
	bumpalo@3.14.0
	byte-tools@0.3.1
	bytemuck@1.14.0
	byteorder@1.5.0
	bytes@1.5.0
	cast@0.3.0
	cc@1.0.83
	cexpr@0.6.0
	cfg-if@1.0.0
	checked_int_cast@1.0.0
	chrono@0.4.31
	ciborium@0.2.1
	ciborium-io@0.2.1
	ciborium-ll@0.2.1
	clang-sys@1.6.1
	clap@4.4.7
	clap_builder@4.4.7
	clap_complete@4.4.4
	clap_derive@4.4.7
	clap_lex@0.6.0
	clru@0.6.1
	color_quant@1.1.0
	colorchoice@1.0.0
	compact_jwt@0.2.10
	concread@0.4.3
	console@0.15.7
	console_error_panic_hook@0.1.7
	cookie@0.16.2
	cookie_store@0.16.2
	core-foundation@0.9.3
	core-foundation-sys@0.8.4
	cpufeatures@0.2.11
	crc32fast@1.3.2
	criterion@0.5.1
	criterion-plot@0.5.0
	cron@0.12.0
	crossbeam@0.8.2
	crossbeam-channel@0.5.8
	crossbeam-deque@0.8.3
	crossbeam-epoch@0.9.15
	crossbeam-queue@0.3.8
	crossbeam-utils@0.8.16
	crossterm@0.25.0
	crossterm_winapi@0.9.1
	crypto-common@0.1.6
	csv@1.3.0
	csv-core@0.1.11
	cursive@0.20.0
	cursive_core@0.3.7
	darling@0.14.4
	darling@0.20.3
	darling_core@0.14.4
	darling_core@0.20.3
	darling_macro@0.14.4
	darling_macro@0.20.3
	data-encoding@2.4.0
	der-parser@7.0.0
	deranged@0.3.9
	derive_builder@0.12.0
	derive_builder_core@0.12.0
	derive_builder_macro@0.12.0
	devd-rs@0.3.6
	dialoguer@0.10.4
	difflib@0.4.0
	digest@0.8.1
	digest@0.10.7
	dirs@4.0.0
	dirs-sys@0.3.7
	displaydoc@0.2.4
	doc-comment@0.3.3
	dunce@1.0.4
	dyn-clone@1.0.14
	either@1.9.0
	encode_unicode@0.3.6
	encoding_rs@0.8.33
	enum-iterator@1.4.1
	enum-iterator-derive@1.2.1
	enum-map@2.7.0
	enum-map-derive@0.14.0
	enumflags2@0.7.8
	enumflags2_derive@0.7.8
	enumset@1.1.3
	enumset_derive@0.8.1
	equivalent@1.0.1
	errno@0.3.5
	escargot@0.5.8
	fake-simd@0.1.2
	fallible-iterator@0.2.0
	fallible-streaming-iterator@0.1.9
	fallible_collections@0.4.9
	fancy-regex@0.11.0
	fantoccini@0.19.3
	faster-hex@0.8.1
	fastrand@2.0.1
	fernet@0.2.1
	file-id@0.1.0
	filetime@0.2.22
	fixedbitset@0.4.2
	flate2@1.0.28
	fnv@1.0.7
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.2.0
	fs2@0.4.3
	fsevent-sys@4.1.0
	futures@0.3.29
	futures-channel@0.3.29
	futures-concurrency@3.1.0
	futures-core@0.3.29
	futures-executor@0.3.29
	futures-io@0.3.29
	futures-macro@0.3.29
	futures-sink@0.3.29
	futures-task@0.3.29
	futures-util@0.3.29
	generic-array@0.12.4
	generic-array@0.14.7
	getrandom@0.2.10
	gif@0.12.0
	gimli@0.28.0
	gix@0.53.1
	gix-actor@0.26.0
	gix-chunk@0.4.4
	gix-commitgraph@0.20.0
	gix-config@0.29.0
	gix-config-value@0.14.0
	gix-date@0.8.0
	gix-diff@0.35.0
	gix-discover@0.24.0
	gix-features@0.34.0
	gix-fs@0.6.0
	gix-glob@0.12.0
	gix-hash@0.13.1
	gix-hashtable@0.4.0
	gix-lock@9.0.0
	gix-macros@0.1.0
	gix-object@0.36.0
	gix-odb@0.52.0
	gix-pack@0.42.0
	gix-path@0.10.0
	gix-quote@0.4.7
	gix-ref@0.36.0
	gix-refspec@0.17.0
	gix-revision@0.21.0
	gix-revwalk@0.7.0
	gix-sec@0.10.0
	gix-tempfile@9.0.0
	gix-trace@0.1.3
	gix-traverse@0.32.0
	gix-url@0.23.0
	gix-utils@0.1.5
	gix-validate@0.8.0
	glob@0.3.1
	gloo@0.8.1
	gloo-console@0.2.3
	gloo-dialogs@0.1.1
	gloo-events@0.1.2
	gloo-file@0.2.3
	gloo-history@0.1.5
	gloo-net@0.3.1
	gloo-render@0.1.1
	gloo-storage@0.2.2
	gloo-timers@0.2.6
	gloo-timers@0.3.0
	gloo-utils@0.1.7
	gloo-utils@0.2.0
	gloo-worker@0.2.1
	h2@0.3.21
	half@1.8.2
	hashbrown@0.12.3
	hashbrown@0.13.2
	hashbrown@0.14.2
	hashlink@0.8.4
	headers@0.3.9
	headers-core@0.2.0
	heck@0.4.1
	hermit-abi@0.3.3
	hex@0.4.3
	home@0.5.5
	hostname-validator@1.1.1
	http@0.2.9
	http-body@0.4.5
	http-range-header@0.3.1
	httparse@1.8.0
	httpdate@1.0.3
	hyper@0.14.27
	hyper-tls@0.5.0
	iana-time-zone@0.1.58
	iana-time-zone-haiku@0.1.2
	ident_case@1.0.1
	idlset@0.2.4
	idna@0.2.3
	idna@0.3.0
	idna@0.4.0
	image@0.23.14
	image@0.24.7
	implicit-clone@0.3.6
	indexmap@1.9.3
	indexmap@2.0.2
	inotify@0.9.6
	inotify-sys@0.1.5
	instant@0.1.12
	ipnet@2.9.0
	is-terminal@0.4.9
	itertools@0.10.5
	itertools@0.11.0
	itoa@1.0.9
	jobserver@0.1.27
	jpeg-decoder@0.3.0
	js-sys@0.3.64
	kqueue@1.0.8
	kqueue-sys@1.0.4
	lazy_static@1.4.0
	lazycell@1.3.0
	lber@0.4.2
	ldap3_client@0.3.5
	ldap3_proto@0.3.5
	libc@0.2.149
	libloading@0.7.4
	libnss@0.4.0
	libsqlite3-sys@0.25.2
	libudev@0.2.0
	libudev-sys@0.1.4
	linux-raw-sys@0.4.10
	lock_api@0.4.11
	lodepng@3.9.1
	log@0.4.20
	lru@0.7.8
	lru@0.8.1
	matchers@0.1.0
	matches@0.1.10
	matchit@0.7.3
	mathru@0.13.0
	mbox@0.6.0
	memchr@2.6.4
	memmap2@0.7.1
	memoffset@0.6.5
	memoffset@0.9.0
	mime@0.3.17
	mime_guess@2.0.4
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.9
	multer@2.1.0
	native-tls@0.2.11
	nom@7.1.3
	nonempty@0.8.1
	notify@6.1.1
	notify-debouncer-full@0.1.0
	nu-ansi-term@0.46.0
	num@0.4.1
	num-bigint@0.4.4
	num-complex@0.4.4
	num-derive@0.3.3
	num-derive@0.4.1
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.3.2
	num-rational@0.4.1
	num-traits@0.2.17
	num_cpus@1.16.0
	num_enum@0.5.11
	num_enum_derive@0.5.11
	num_threads@0.1.6
	oauth2@4.4.2
	object@0.32.1
	oid@0.2.1
	oid-registry@0.4.0
	once_cell@1.18.0
	oorandom@11.1.3
	opaque-debug@0.2.3
	openssl@0.10.57
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.93
	overload@0.1.1
	owning_ref@0.4.1
	parking_lot@0.11.2
	parking_lot@0.12.1
	parking_lot_core@0.8.6
	parking_lot_core@0.9.9
	password-hash@0.5.0
	paste@0.1.18
	paste@1.0.14
	paste-impl@0.1.18
	peeking_take_while@0.1.2
	peg@0.8.2
	peg-macros@0.8.2
	peg-runtime@0.8.2
	percent-encoding@2.3.0
	pest@2.7.5
	petgraph@0.6.4
	picky-asn1@0.8.0
	picky-asn1-der@0.4.1
	picky-asn1-x509@0.12.0
	pin-project@1.1.3
	pin-project-internal@1.1.3
	pin-project-lite@0.2.13
	pin-utils@0.1.0
	pinned@0.1.0
	pkg-config@0.3.27
	plotters@0.3.5
	plotters-backend@0.3.5
	plotters-svg@0.3.5
	powerfmt@0.2.0
	ppv-lite86@0.2.17
	predicates@3.0.4
	predicates-core@1.0.6
	predicates-tree@1.0.9
	prettyplease@0.1.25
	prettyplease@0.2.15
	proc-macro-crate@1.3.1
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro-hack@0.5.20+deprecated
	proc-macro2@1.0.69
	prodash@26.2.2
	prokio@0.1.0
	psl-types@2.0.11
	publicsuffix@2.2.3
	qrcode@0.12.0
	quick-error@2.0.1
	quote@1.0.33
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon@1.8.0
	rayon-core@1.12.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_syscall@0.4.1
	redox_users@0.4.3
	reference-counted-singleton@0.1.2
	regex@1.10.2
	regex-automata@0.1.10
	regex-automata@0.4.3
	regex-syntax@0.6.29
	regex-syntax@0.8.2
	reqwest@0.11.22
	rgb@0.8.37
	route-recognizer@0.3.1
	rpassword@5.0.1
	rpassword@7.2.0
	rtoolbox@0.0.1
	runloop@0.1.0
	rusqlite@0.28.0
	rust-embed@8.0.0
	rust-embed-impl@8.0.0
	rust-embed-utils@8.0.0
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustc_version@0.3.3
	rusticata-macros@4.1.0
	rustix@0.38.21
	rustversion@1.0.14
	ryu@1.0.15
	same-file@1.0.6
	schannel@0.1.22
	scim_proto@0.2.1
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sd-notify@0.4.1
	security-framework@2.9.2
	security-framework-sys@2.9.1
	selinux@0.4.2
	selinux-sys@0.6.6
	semver@0.11.0
	semver-parser@0.10.2
	serde@1.0.190
	serde-wasm-bindgen@0.4.5
	serde-wasm-bindgen@0.5.0
	serde_bytes@0.11.12
	serde_cbor@0.11.2
	serde_cbor_2@0.12.0-dev
	serde_derive@1.0.190
	serde_json@1.0.108
	serde_path_to_error@0.1.14
	serde_urlencoded@0.7.1
	serde_with@3.4.0
	serde_with_macros@3.4.0
	sha1@0.10.6
	sha1_smol@1.0.0
	sha2@0.8.2
	sha2@0.10.8
	sharded-slab@0.1.7
	shell-words@1.1.0
	shellexpand@2.1.2
	shlex@1.2.0
	signal-hook@0.3.17
	signal-hook-mio@0.2.3
	signal-hook-registry@1.4.1
	slab@0.4.9
	smallvec@1.11.1
	smartstring@1.0.1
	smolset@1.3.1
	socket2@0.4.10
	socket2@0.5.5
	spin@0.9.8
	sptr@0.3.2
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	strsim@0.10.0
	subtle@2.5.0
	svg@0.13.1
	syn@1.0.109
	syn@2.0.38
	sync_wrapper@0.1.2
	synstructure@0.12.6
	system-configuration@0.5.1
	system-configuration-sys@0.5.0
	target-lexicon@0.12.12
	tempfile@3.8.1
	termtree@0.4.1
	thiserror@1.0.50
	thiserror-impl@1.0.50
	thread_local@1.1.7
	tikv-jemalloc-sys@0.5.4+5.3.0-patched
	tikv-jemallocator@0.5.4
	time@0.3.30
	time-core@0.1.2
	time-macros@0.2.15
	tinytemplate@1.2.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.33.0
	tokio-macros@2.1.0
	tokio-native-tls@0.3.1
	tokio-openssl@0.6.3
	tokio-stream@0.1.14
	tokio-util@0.7.10
	toml@0.5.11
	toml_datetime@0.6.5
	toml_edit@0.19.15
	tower@0.4.13
	tower-http@0.4.4
	tower-layer@0.3.2
	tower-service@0.3.2
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-forest@0.1.6
	tracing-log@0.1.4
	tracing-serde@0.1.3
	tracing-subscriber@0.3.17
	try-lock@0.2.4
	tss-esapi@7.4.0
	tss-esapi-sys@0.5.0
	typenum@1.17.0
	ucd-trie@0.1.6
	unicase@2.7.0
	unicode-bidi@0.3.13
	unicode-bom@2.0.2
	unicode-ident@1.0.12
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.11
	unicode-xid@0.2.4
	url@2.4.1
	urlencoding@2.1.3
	utf8parse@0.2.1
	utoipa@4.0.0
	utoipa-gen@4.0.0
	utoipa-swagger-ui@4.0.0
	uuid@1.5.0
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	wait-timeout@0.2.0
	walkdir@2.4.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-futures@0.4.37
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	wasm-bindgen-test@0.3.37
	wasm-bindgen-test-macro@0.3.37
	wasm-timer@0.2.5
	web-sys@0.3.64
	webdriver@0.46.0
	weezl@0.1.7
	which@4.4.2
	whoami@1.4.1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.41.0
	windows@0.48.0
	windows-core@0.51.1
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.5
	windows_aarch64_gnullvm@0.41.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_msvc@0.41.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.5
	windows_i686_gnu@0.41.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.5
	windows_i686_msvc@0.41.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.5
	windows_x86_64_gnu@0.41.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnullvm@0.41.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_msvc@0.41.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.5
	winnow@0.5.18
	winreg@0.50.0
	x509-parser@0.13.2
	xi-unicode@0.3.0
	yew@0.20.0
	yew-macro@0.20.0
	yew-router@0.17.0
	yew-router-macro@0.17.0
	zerocopy@0.7.20
	zerocopy-derive@0.7.20
	zeroize@1.6.0
	zeroize_derive@1.4.2
	zip@0.6.6
	zstd@0.13.0
	zstd-safe@7.0.0
	zstd-sys@2.0.9+zstd.1.5.5
	zxcvbn@2.2.2
"

declare -A GIT_CRATES=(
	[base64urlsafedata]="https://github.com/kanidm/webauthn-rs;2218d2055c0c900ef57b398423eee5e8d5521f4c;webauthn-rs-%commit%/base64urlsafedata"
	[webauthn-attestation-ca]="https://github.com/kanidm/webauthn-rs;2218d2055c0c900ef57b398423eee5e8d5521f4c;webauthn-rs-%commit%/attestation-ca"
	[webauthn-authenticator-rs]="https://github.com/kanidm/webauthn-rs;2218d2055c0c900ef57b398423eee5e8d5521f4c;webauthn-rs-%commit%/webauthn-authenticator-rs"
	[webauthn-rs]="https://github.com/kanidm/webauthn-rs;2218d2055c0c900ef57b398423eee5e8d5521f4c;webauthn-rs-%commit%/webauthn-rs"
	[webauthn-rs-core]="https://github.com/kanidm/webauthn-rs;2218d2055c0c900ef57b398423eee5e8d5521f4c;webauthn-rs-%commit%/webauthn-rs-core"
	[webauthn-rs-proto]="https://github.com/kanidm/webauthn-rs;2218d2055c0c900ef57b398423eee5e8d5521f4c;webauthn-rs-%commit%/webauthn-rs-proto"
	[sshkey-attest]="https://github.com/kanidm/webauthn-rs;2218d2055c0c900ef57b398423eee5e8d5521f4c;webauthn-rs-%commit%/sshkey-attest"
	[sshkeys]="https://github.com/dnaeon/rust-sshkeys;fa5bd02dd6e90ee724fdb981253c1e7726a7f534;rust-sshkeys-%commit%"
)

inherit bash-completion-r1 cargo pam systemd

MY_PV="${PV/rc/rc.}"
MY_PV="${MY_PV/_/-}"
MY_P="kanidm-${MY_PV}"

DESCRIPTION="Kanidm Unix Integration Clients"
HOMEPAGE="https://kanidm.com https://github.com/kanidm/kanidm"
SRC_URI="https://github.com/kanidm/kanidm/archive/v${MY_PV}.tar.gz -> kanidm-${PV}.tar.gz"
SRC_URI+=" $(cargo_crate_uris)"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions Artistic-2 BSD Boost-1.0 CC0-1.0 ISC LGPL-3 MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

IUSE="doc selinux"
PDEPEND="doc? ( ~app-doc/kanidm-docs-${PV} )"
RDEPEND="
	acct-user/kanidm-unixd
	~net-nds/kanidm-clients-${PV}
	dev-libs/openssl:=
	sys-libs/pam
	virtual/udev
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-arch/zstd
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/.*"

S="${WORKDIR}/${MY_P}"

src_compile() {
	sed -i "s|^\[patch.'https://github.com/kanidm/webauthn-rs'\]|[patch.crates-io]|" \
		"${CARGO_HOME}"/config || die Failed patching cargo config

	local features="unix"
	use selinux && features+=",selinux"

	export KANIDM_BUILD_PROFILE=release_suse_generic
	cargo_src_compile \
		--bin kanidm_ssh_authorizedkeys \
		--bin kanidm_ssh_authorizedkeys_direct
	cargo_src_compile -p pam_kanidm
	cargo_src_compile -p nss_kanidm
	cargo_src_compile --features "${features}" -p kanidm_unix_int \
		--bin kanidm_unixd \
		--bin kanidm_unixd_tasks \
		--bin kanidm-unix
}

src_install() {
	dosbin target/release/kanidm_ssh_authorizedkeys
	dosbin target/release/kanidm_ssh_authorizedkeys_direct

	newlib.so target/release/libnss_kanidm.so libnss_kanidm.so.2
	newpammod target/release/libpam_kanidm.so pam_kanidm.so

	dosbin target/release/kanidm_unixd
	dosbin target/release/kanidm_unixd_tasks
	dobin target/release/kanidm-unix

	insinto /etc/kanidm
	doins examples/unixd

	newconfd "${FILESDIR}/kanidm-unixd.confd" kanidm-unixd

	newinitd "${FILESDIR}/kanidm-unixd.initd" kanidm-unixd
	systemd_dounit platform/opensuse/kanidm-unixd.service
	systemd_dounit platform/opensuse/kanidm-unixd-tasks.service
	systemd_install_serviced "${FILESDIR}"/kanidm-unixd.service.conf

	newbashcomp target/release/build/completions/kanidm_ssh_authorizedkeys.bash kanidm_ssh_authorizedkeys
	newbashcomp target/release/build/completions/kanidm_ssh_authorizedkeys_direct.bash kanidm_ssh_authorizedkeys_direct
	newbashcomp target/release/build/completions/kanidm_unix.bash kanidm_unix

	insinto /usr/share/zsh/site-functions
	doins target/release/build/completions/_kanidm_ssh_authorizedkeys
	doins target/release/build/completions/_kanidm_ssh_authorizedkeys_direct
	doins target/release/build/completions/_kanidm_unix
}
