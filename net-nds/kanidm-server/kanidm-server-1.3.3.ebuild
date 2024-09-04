# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.22.0
	adler@1.0.2
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.18
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anes@0.1.6
	anstream@0.6.15
	anstyle@1.0.8
	anstyle-parse@0.2.5
	anstyle-query@1.1.1
	anstyle-wincon@3.0.4
	anyhow@1.0.86
	anymap2@0.13.0
	arc-swap@1.7.1
	argon2@0.5.3
	askama@0.12.1
	askama_derive@0.12.5
	askama_escape@0.10.3
	askama_parser@0.2.1
	asn1-rs@0.3.1
	asn1-rs-derive@0.1.0
	asn1-rs-impl@0.1.0
	assert_cmd@2.0.16
	async-compression@0.4.12
	async-recursion@1.1.1
	async-stream@0.3.5
	async-stream-impl@0.3.5
	async-trait@0.1.81
	atomic-waker@1.1.2
	authenticator-ctap2-2021@0.3.2-dev.1
	autocfg@1.3.0
	axum@0.6.20
	axum@0.7.5
	axum-auth@0.7.0
	axum-core@0.3.4
	axum-core@0.4.3
	axum-extra@0.9.3
	axum-htmx@0.5.0
	axum-macros@0.4.1
	axum-server@0.6.0
	backtrace@0.3.73
	base32@0.5.1
	base64@0.13.1
	base64@0.21.7
	base64@0.22.1
	base64ct@1.6.0
	base64urlsafedata@0.1.3
	base64urlsafedata@0.5.0
	basic-toml@0.1.9
	bincode@1.3.3
	bindgen@0.66.1
	bindgen@0.69.4
	bit-set@0.5.3
	bit-vec@0.6.3
	bitfield@0.13.2
	bitflags@1.3.2
	bitflags@2.6.0
	blake2@0.10.6
	block-buffer@0.10.4
	boolinator@2.4.0
	bstr@1.10.0
	bumpalo@3.16.0
	bytecount@0.6.8
	bytemuck@1.17.0
	byteorder@1.5.0
	bytes@1.7.1
	cast@0.3.0
	cc@1.1.13
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	checked_int_cast@1.0.0
	chrono@0.4.38
	ciborium@0.2.2
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	clang-sys@1.8.1
	clap@4.5.16
	clap_builder@4.5.15
	clap_complete@4.5.19
	clap_derive@4.5.13
	clap_lex@0.7.2
	clru@0.6.2
	color_quant@1.1.0
	colorchoice@1.0.2
	compact_jwt@0.2.10
	compact_jwt@0.4.2
	concread@0.5.3
	console@0.15.8
	console_error_panic_hook@0.1.7
	const-oid@0.9.6
	cookie@0.16.2
	cookie@0.18.1
	cookie_store@0.21.0
	core-foundation@0.9.4
	core-foundation-sys@0.8.7
	cpufeatures@0.2.13
	crc32fast@1.4.2
	criterion@0.5.1
	criterion-plot@0.5.0
	cron@0.12.1
	crossbeam@0.8.4
	crossbeam-channel@0.5.13
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.11
	crossbeam-utils@0.8.20
	crunchy@0.2.2
	crypto-common@0.1.6
	csv@1.3.0
	csv-core@0.1.11
	darling@0.14.4
	darling@0.20.10
	darling_core@0.14.4
	darling_core@0.20.10
	darling_macro@0.14.4
	darling_macro@0.20.10
	data-encoding@2.6.0
	der@0.7.9
	der-parser@7.0.0
	der_derive@0.7.3
	deranged@0.3.11
	derive_builder@0.12.0
	derive_builder_core@0.12.0
	derive_builder_macro@0.12.0
	devd-rs@0.3.6
	dhat@0.3.3
	dialoguer@0.10.4
	difflib@0.4.0
	digest@0.10.7
	dirs@4.0.0
	dirs-sys@0.3.7
	displaydoc@0.2.5
	doc-comment@0.3.3
	dunce@1.0.5
	dyn-clone@1.0.17
	either@1.13.0
	encode_unicode@0.3.6
	encoding_rs@0.8.34
	enum-iterator@2.1.0
	enum-iterator-derive@1.4.0
	enumflags2@0.7.10
	enumflags2_derive@0.7.10
	equivalent@1.0.1
	errno@0.3.9
	escargot@0.5.12
	fallible-iterator@0.2.0
	fallible-streaming-iterator@0.1.9
	fancy-regex@0.11.0
	fancy-regex@0.13.0
	fantoccini@0.21.1
	faster-hex@0.9.0
	fastrand@2.1.0
	fernet@0.2.2
	file-id@0.1.0
	filetime@0.2.24
	fixedbitset@0.4.2
	flagset@0.4.6
	flate2@1.0.31
	fnv@1.0.7
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.2.1
	fraction@0.15.3
	fs4@0.8.4
	fsevent-sys@4.1.0
	futures@0.3.30
	futures-channel@0.3.30
	futures-concurrency@3.1.0
	futures-core@0.3.30
	futures-executor@0.3.30
	futures-io@0.3.30
	futures-macro@0.3.30
	futures-sink@0.3.30
	futures-task@0.3.30
	futures-util@0.3.30
	generic-array@0.14.7
	gethostname@0.5.0
	getrandom@0.2.15
	gif@0.13.1
	gimli@0.29.0
	gix@0.64.0
	gix-actor@0.31.5
	gix-chunk@0.4.8
	gix-commitgraph@0.24.3
	gix-config@0.38.0
	gix-config-value@0.14.7
	gix-date@0.8.7
	gix-diff@0.44.1
	gix-discover@0.33.0
	gix-features@0.38.2
	gix-fs@0.11.2
	gix-glob@0.16.4
	gix-hash@0.14.2
	gix-hashtable@0.5.2
	gix-lock@14.0.0
	gix-macros@0.1.5
	gix-object@0.42.3
	gix-odb@0.61.1
	gix-pack@0.51.1
	gix-path@0.10.9
	gix-quote@0.4.12
	gix-ref@0.45.0
	gix-refspec@0.23.1
	gix-revision@0.27.2
	gix-revwalk@0.13.2
	gix-sec@0.10.7
	gix-tempfile@14.0.1
	gix-trace@0.1.9
	gix-traverse@0.39.2
	gix-url@0.27.4
	gix-utils@0.1.12
	gix-validate@0.8.5
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
	h2@0.3.26
	h2@0.4.6
	half@1.8.3
	half@2.4.1
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashlink@0.8.4
	heck@0.4.1
	heck@0.5.0
	hermit-abi@0.3.9
	hermit-abi@0.4.0
	hex@0.4.3
	home@0.5.9
	hostname-validator@1.1.1
	http@0.2.12
	http@1.1.0
	http-body@0.4.6
	http-body@1.0.1
	http-body-util@0.1.2
	http-range-header@0.4.1
	httparse@1.9.4
	httpdate@1.0.3
	humansize@2.1.3
	hyper@0.14.30
	hyper@1.4.1
	hyper-rustls@0.27.2
	hyper-timeout@0.4.1
	hyper-tls@0.6.0
	hyper-util@0.1.7
	iana-time-zone@0.1.60
	iana-time-zone-haiku@0.1.2
	ident_case@1.0.1
	idlset@0.2.5
	idna@0.3.0
	idna@0.5.0
	image@0.23.14
	image@0.24.9
	implicit-clone@0.3.9
	indexmap@1.9.3
	indexmap@2.4.0
	inotify@0.9.6
	inotify-sys@0.1.5
	instant@0.1.13
	ipnet@2.9.0
	is-terminal@0.4.13
	is_terminal_polyfill@1.70.1
	iso8601@0.6.1
	itertools@0.10.5
	itertools@0.12.1
	itertools@0.13.0
	itoa@1.0.11
	jpeg-decoder@0.3.1
	js-sys@0.3.70
	jsonschema@0.18.0
	kanidm-hsm-crypto@0.2.0
	kqueue@1.0.8
	kqueue-sys@1.0.4
	lazy_static@1.5.0
	lazycell@1.3.0
	lber@0.4.2
	ldap3_client@0.5.1
	ldap3_proto@0.5.1
	libc@0.2.158
	libloading@0.8.5
	libm@0.2.8
	libmimalloc-sys@0.1.39
	libnss@0.8.0
	libredox@0.1.3
	libsqlite3-sys@0.25.2
	libudev@0.2.0
	libudev-sys@0.1.4
	linux-raw-sys@0.4.14
	lock_api@0.4.12
	lodepng@3.10.5
	log@0.4.22
	lru@0.12.4
	malloced@1.3.1
	matchers@0.1.0
	matchit@0.7.3
	mathru@0.13.0
	memchr@2.7.4
	memmap2@0.9.4
	memoffset@0.6.5
	mimalloc@0.1.43
	mime@0.3.17
	mime_guess@2.0.5
	minicov@0.3.5
	minimal-lexical@0.2.1
	miniz_oxide@0.7.4
	mintex@0.1.3
	mio@0.8.11
	mio@1.0.2
	multer@3.1.0
	native-tls@0.2.12
	nix@0.29.0
	nom@7.1.3
	nonempty@0.8.1
	notify@6.1.1
	notify-debouncer-full@0.1.0
	nu-ansi-term@0.46.0
	num@0.4.3
	num-bigint@0.4.6
	num-cmp@0.1.0
	num-complex@0.4.6
	num-conv@0.1.0
	num-derive@0.3.3
	num-integer@0.1.46
	num-iter@0.1.45
	num-rational@0.3.2
	num-rational@0.4.2
	num-traits@0.2.19
	num_cpus@1.16.0
	num_enum@0.5.11
	num_enum_derive@0.5.11
	num_threads@0.1.7
	oauth2@4.4.2
	object@0.36.3
	oid@0.2.1
	oid-registry@0.4.0
	once_cell@1.19.0
	oorandom@11.1.4
	openssl@0.10.66
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.103
	opentelemetry@0.20.0
	opentelemetry-http@0.9.0
	opentelemetry-otlp@0.13.0
	opentelemetry-proto@0.3.0
	opentelemetry-semantic-conventions@0.12.0
	opentelemetry_api@0.20.0
	opentelemetry_sdk@0.20.0
	ordered-float@3.9.2
	overload@0.1.1
	parking_lot@0.11.2
	parking_lot@0.12.3
	parking_lot_core@0.8.6
	parking_lot_core@0.9.10
	password-hash@0.5.0
	paste@1.0.15
	peeking_take_while@0.1.2
	peg@0.8.4
	peg-macros@0.8.4
	peg-runtime@0.8.3
	pem-rfc7468@0.7.0
	percent-encoding@2.3.1
	petgraph@0.6.5
	picky-asn1@0.8.0
	picky-asn1-der@0.4.1
	picky-asn1-x509@0.12.0
	pin-project@1.1.5
	pin-project-internal@1.1.5
	pin-project-lite@0.2.14
	pin-utils@0.1.0
	pinned@0.1.0
	pkg-config@0.3.30
	plotters@0.3.6
	plotters-backend@0.3.6
	plotters-svg@0.3.6
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	prctl@1.0.0
	predicates@3.1.2
	predicates-core@1.0.8
	predicates-tree@1.0.11
	prettyplease@0.1.25
	prettyplease@0.2.20
	proc-macro-crate@1.3.1
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro2@1.0.86
	prodash@28.0.0
	prokio@0.1.0
	prost@0.11.9
	prost-derive@0.11.9
	psl-types@2.0.11
	publicsuffix@2.2.3
	qrcode@0.12.0
	quick-error@2.0.1
	quote@1.0.36
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon@1.10.0
	rayon-core@1.12.1
	redox_syscall@0.2.16
	redox_syscall@0.4.1
	redox_syscall@0.5.3
	redox_users@0.4.6
	reference-counted-singleton@0.1.4
	regex@1.10.6
	regex-automata@0.1.10
	regex-automata@0.4.7
	regex-syntax@0.6.29
	regex-syntax@0.8.4
	reqwest@0.12.7
	rgb@0.8.48
	ring@0.17.8
	route-recognizer@0.3.1
	rpassword@5.0.1
	rpassword@7.3.1
	rtoolbox@0.0.2
	runloop@0.1.0
	rusqlite@0.28.0
	rust-embed@8.5.0
	rust-embed-impl@8.5.0
	rust-embed-utils@8.5.0
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rusticata-macros@4.1.0
	rustix@0.38.34
	rustls@0.23.12
	rustls-pemfile@2.1.3
	rustls-pki-types@1.8.0
	rustls-webpki@0.102.6
	rustversion@1.0.17
	ryu@1.0.18
	same-file@1.0.6
	schannel@0.1.23
	scoped-tls@1.0.1
	scopeguard@1.2.0
	sd-notify@0.4.2
	security-framework@2.11.1
	security-framework-sys@2.11.1
	selinux@0.4.5
	selinux-sys@0.6.10
	semver@1.0.23
	serde@1.0.208
	serde-wasm-bindgen@0.4.5
	serde-wasm-bindgen@0.5.0
	serde_bytes@0.11.15
	serde_cbor@0.11.2
	serde_cbor_2@0.12.0-dev
	serde_derive@1.0.208
	serde_json@1.0.125
	serde_path_to_error@0.1.16
	serde_urlencoded@0.7.1
	serde_with@3.9.0
	serde_with_macros@3.9.0
	sha1_smol@1.0.1
	sha2@0.10.8
	sharded-slab@0.1.7
	shell-words@1.1.0
	shellexpand@2.1.2
	shlex@1.3.0
	signal-hook-registry@1.4.2
	slab@0.4.9
	smallvec@1.13.2
	smartstring@1.0.1
	smolset@1.3.1
	socket2@0.5.7
	spin@0.9.8
	spki@0.7.3
	sptr@0.3.2
	sshkey-attest@0.5.0
	sshkeys@0.3.3
	static_assertions@1.1.0
	strsim@0.10.0
	strsim@0.11.1
	subtle@2.6.1
	svg@0.13.1
	syn@1.0.109
	syn@2.0.75
	sync_wrapper@0.1.2
	sync_wrapper@1.0.1
	synstructure@0.12.6
	target-lexicon@0.12.16
	tempfile@3.12.0
	termtree@0.4.1
	thiserror@1.0.63
	thiserror-impl@1.0.63
	thousands@0.2.0
	thread_local@1.1.8
	time@0.3.36
	time-core@0.1.2
	time-macros@0.2.18
	tinytemplate@1.2.1
	tinyvec@1.8.0
	tinyvec_macros@0.1.1
	tls_codec@0.4.1
	tls_codec_derive@0.4.1
	tokio@1.39.3
	tokio-io-timeout@1.2.0
	tokio-macros@2.4.0
	tokio-native-tls@0.3.1
	tokio-openssl@0.6.4
	tokio-rustls@0.26.0
	tokio-stream@0.1.15
	tokio-util@0.7.11
	toml@0.5.11
	toml_datetime@0.6.8
	toml_edit@0.19.15
	tonic@0.9.2
	tower@0.4.13
	tower-http@0.5.2
	tower-layer@0.3.3
	tower-service@0.3.3
	tracing@0.1.40
	tracing-attributes@0.1.27
	tracing-core@0.1.32
	tracing-forest@0.1.6
	tracing-log@0.1.4
	tracing-log@0.2.0
	tracing-opentelemetry@0.21.0
	tracing-serde@0.1.3
	tracing-subscriber@0.3.18
	try-lock@0.2.5
	tss-esapi@8.0.0-alpha
	tss-esapi-sys@0.5.0
	typenum@1.17.0
	unicase@2.7.0
	unicode-bidi@0.3.15
	unicode-bom@2.0.3
	unicode-ident@1.0.12
	unicode-normalization@0.1.23
	unicode-segmentation@1.11.0
	unicode-width@0.1.13
	unicode-xid@0.2.5
	untrusted@0.9.0
	url@2.5.2
	urlencoding@2.1.3
	utf8parse@0.2.2
	utoipa@4.2.3
	utoipa-gen@4.3.0
	utoipa-swagger-ui@6.0.0
	uuid@1.10.0
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.5
	wait-timeout@0.2.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasite@0.1.0
	wasm-bindgen@0.2.93
	wasm-bindgen-backend@0.2.93
	wasm-bindgen-futures@0.4.43
	wasm-bindgen-macro@0.2.93
	wasm-bindgen-macro-support@0.2.93
	wasm-bindgen-shared@0.2.93
	wasm-bindgen-test@0.3.43
	wasm-bindgen-test-macro@0.3.43
	wasm-timer@0.2.5
	web-sys@0.3.70
	webauthn-attestation-ca@0.5.0
	webauthn-authenticator-rs@0.5.0
	webauthn-rs@0.5.0
	webauthn-rs-core@0.5.0
	webauthn-rs-proto@0.5.0
	webdriver@0.50.0
	weezl@0.1.8
	which@4.4.2
	whoami@1.5.1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.41.0
	windows-core@0.52.0
	windows-registry@0.2.0
	windows-result@0.2.0
	windows-strings@0.1.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows_aarch64_gnullvm@0.41.0
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_msvc@0.41.0
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.6
	windows_i686_gnu@0.41.0
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.6
	windows_i686_gnullvm@0.52.6
	windows_i686_msvc@0.41.0
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.6
	windows_x86_64_gnu@0.41.0
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnullvm@0.41.0
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_msvc@0.41.0
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.6
	winnow@0.5.40
	winnow@0.6.18
	x509-cert@0.2.5
	x509-parser@0.13.2
	yew@0.20.0
	yew-macro@0.20.0
	yew-router@0.17.0
	yew-router-macro@0.17.0
	zerocopy@0.7.35
	zerocopy-derive@0.7.35
	zeroize@1.8.1
	zeroize_derive@1.4.2
	zip@0.6.6
	zxcvbn@2.2.2
"

inherit bash-completion-r1 cargo optfeature systemd

MY_PV="${PV/rc/rc.}"
MY_PV="${MY_PV/_/-}"
MY_P="kanidm-${MY_PV}"

DESCRIPTION="Kanidm Server Daemon"
HOMEPAGE="https://kanidm.com https://github.com/kanidm/kanidm"
SRC_URI="https://github.com/kanidm/kanidm/archive/v${MY_PV}.tar.gz -> kanidm-${PV}.tar.gz"
SRC_URI+=" $(cargo_crate_uris)"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions Artistic-2 BSD Boost-1.0 CC0-1.0 ISC LGPL-3 MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

IUSE="doc"
PDEPEND="doc? ( ~app-doc/kanidm-docs-${PV} )"
RDEPEND="
	acct-user/kanidmd
	dev-db/sqlite:3
	dev-libs/openssl:=
	sys-libs/zlib
"
DEPEND="${RDEPEND}"
BDEPEND="
	app-arch/zstd
	virtual/pkgconfig
"

QA_FLAGS_IGNORED="usr/bin/.*"

S="${WORKDIR}/${MY_P}"

src_compile() {
	# Unpatch unstable crates
	#sed -i "s|^\[patch.'https://github.com/kanidm/webauthn-rs'\]|[patch.crates-io]|" \
	#	"${CARGO_HOME}"/config || die Failed patching cargo config

	export KANIDM_BUILD_PROFILE=release_linux
	cargo_src_compile --bin kanidmd
	cargo_src_compile -p kanidm-ipa-sync
}

src_install() {
	dosbin "$(cargo_target_dir)"/kanidmd
	dosbin "$(cargo_target_dir)"/kanidm-ipa-sync

	insinto /etc/kanidm
	doins examples/server.toml

	fowners kanidmd:root /etc/kanidm/server.toml
	fperms 0400 /etc/kanidm/server.toml

	keepdir /var/lib/kanidm
	fowners kanidmd:root /var/lib/kanidm
	fperms 0700 /var/lib/kanidm

	newconfd "${FILESDIR}/kanidmd.confd" kanidmd

	newinitd "${FILESDIR}/kanidmd.initd" kanidmd
	systemd_dounit platform/opensuse/kanidmd.service
	systemd_install_serviced "${FILESDIR}"/kanidmd.service.conf

	# web interface files
	rm server/web_ui/pkg/ANYTHING_HERE_WILL_BE_DELETED_ADD_TO_SRC || die
	insinto /usr/share/kanidm/ui
	doins -r server/web_ui/pkg

	newbashcomp "$(cargo_target_dir)"/build/completions/kanidmd.bash kanidmd

	insinto /usr/share/zsh/site-functions
	doins "$(cargo_target_dir)"/build/completions/_kanidmd
}

pkg_postinst() {
	optfeature "clients to administrate the Kanidm Server" net-nds/kanidm-clients
	optfeature "Unix integration clients with the Kanidm Server" net-nds/kanidm-unixd-clients
}
