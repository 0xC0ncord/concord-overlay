# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.24.2
	adler2@2.0.0
	ahash@0.8.11
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anstream@0.6.18
	anstyle-parse@0.2.6
	anstyle-query@1.1.2
	anstyle-wincon@3.0.7
	anstyle@1.0.10
	anyhow@1.0.95
	arc-swap@1.7.1
	argon2@0.5.3
	askama@0.12.1
	askama_axum@0.4.0
	askama_derive@0.12.5
	askama_escape@0.10.3
	askama_parser@0.2.1
	asn1-rs-derive@0.5.1
	asn1-rs-impl@0.2.0
	asn1-rs@0.6.2
	async-compression@0.4.18
	async-stream-impl@0.3.6
	async-stream@0.3.6
	async-trait@0.1.86
	atomic-waker@1.1.2
	authenticator@0.4.1
	autocfg@1.4.0
	axum-core@0.4.5
	axum-extra@0.9.6
	axum-htmx@0.5.0
	axum-macros@0.4.2
	axum-server@0.7.1
	axum@0.7.9
	backtrace@0.3.74
	base32@0.5.1
	base64@0.13.1
	base64@0.21.7
	base64@0.22.1
	base64ct@1.6.0
	base64urlsafedata@0.5.1
	basic-toml@0.1.9
	bindgen@0.66.1
	bindgen@0.70.1
	bit-set@0.5.3
	bit-set@0.8.0
	bit-vec@0.6.3
	bit-vec@0.8.0
	bitfield@0.13.2
	bitflags@1.3.2
	bitflags@2.8.0
	blake2@0.10.6
	block-buffer@0.10.4
	borrow-or-share@0.2.2
	bstr@1.11.3
	bumpalo@3.17.0
	bytecount@0.6.8
	bytemuck@1.21.0
	byteorder@1.5.0
	bytes@1.10.0
	cc@1.2.13
	cexpr@0.6.0
	cfg-if@1.0.0
	cfg_aliases@0.2.1
	checked_int_cast@1.0.0
	chrono@0.4.39
	clang-sys@1.8.1
	clap@4.5.28
	clap_builder@4.5.27
	clap_complete@4.5.44
	clap_derive@4.5.28
	clap_lex@0.7.4
	clru@0.6.2
	color_quant@1.1.0
	colorchoice@1.0.3
	compact_jwt@0.4.3
	concread@0.5.3
	console@0.15.10
	const-oid@0.9.6
	cookie@0.16.2
	cookie@0.18.1
	cookie_store@0.21.1
	core-foundation-sys@0.8.7
	core-foundation@0.10.0
	core-foundation@0.9.4
	cpufeatures@0.2.17
	crc32fast@1.4.2
	cron@0.15.0
	crossbeam-channel@0.5.14
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-queue@0.3.12
	crossbeam-utils@0.8.21
	crossbeam@0.8.4
	crypto-common@0.1.6
	csv-core@0.1.11
	csv@1.3.1
	darling@0.14.4
	darling@0.20.10
	darling_core@0.14.4
	darling_core@0.20.10
	darling_macro@0.14.4
	darling_macro@0.20.10
	data-encoding@2.7.0
	der-parser@9.0.0
	der@0.7.9
	der_derive@0.7.3
	deranged@0.3.11
	derive_builder@0.12.0
	derive_builder_core@0.12.0
	derive_builder_macro@0.12.0
	devd-rs@0.3.6
	dhat@0.3.3
	dialoguer@0.11.0
	digest@0.10.7
	dirs-sys@0.3.7
	dirs@4.0.0
	displaydoc@0.2.5
	document-features@0.2.10
	dunce@1.0.5
	dyn-clone@1.0.18
	either@1.13.0
	email_address@0.2.9
	encode_unicode@1.0.0
	encoding_rs@0.8.35
	enum-iterator-derive@1.4.0
	enum-iterator@2.1.0
	enumflags2@0.7.11
	enumflags2_derive@0.7.11
	equivalent@1.0.1
	errno@0.3.10
	escargot@0.5.13
	fallible-iterator@0.2.0
	fallible-streaming-iterator@0.1.9
	fancy-regex@0.11.0
	fancy-regex@0.14.0
	fantoccini@0.21.4
	faster-hex@0.9.0
	fastrand@2.3.0
	fernet@0.2.2
	file-id@0.1.0
	filetime@0.2.25
	fixedbitset@0.5.7
	flagset@0.4.6
	flate2@1.0.35
	fluent-uri@0.3.2
	fnv@1.0.7
	foldhash@0.1.4
	foreign-types-shared@0.1.1
	foreign-types@0.3.2
	form_urlencoded@1.2.1
	fraction@0.15.3
	fs4@0.12.0
	fsevent-sys@4.1.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-macro@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	generic-array@0.14.7
	getrandom@0.2.15
	getrandom@0.3.1
	gif@0.13.1
	gimli@0.31.1
	gix-actor@0.31.5
	gix-chunk@0.4.11
	gix-commitgraph@0.24.3
	gix-config-value@0.14.11
	gix-config@0.38.0
	gix-date@0.8.7
	gix-diff@0.44.1
	gix-discover@0.33.0
	gix-features@0.38.2
	gix-fs@0.11.3
	gix-glob@0.16.5
	gix-hash@0.14.2
	gix-hashtable@0.5.2
	gix-lock@14.0.0
	gix-macros@0.1.5
	gix-object@0.42.3
	gix-odb@0.61.1
	gix-pack@0.51.1
	gix-path@0.10.14
	gix-quote@0.4.15
	gix-ref@0.45.0
	gix-refspec@0.23.1
	gix-revision@0.27.2
	gix-revwalk@0.13.2
	gix-sec@0.10.11
	gix-tempfile@14.0.2
	gix-trace@0.1.12
	gix-traverse@0.39.2
	gix-url@0.27.5
	gix-utils@0.1.14
	gix-validate@0.8.5
	gix@0.64.0
	glob@0.3.2
	h2@0.3.26
	h2@0.4.7
	half@1.8.3
	hashbrown@0.12.3
	hashbrown@0.14.5
	hashbrown@0.15.2
	hashlink@0.8.4
	heck@0.5.0
	hex@0.4.3
	home@0.5.11
	hostname-validator@1.1.1
	http-body-util@0.1.2
	http-body@0.4.6
	http-body@1.0.1
	http-range-header@0.4.2
	http@0.2.12
	http@1.2.0
	httparse@1.10.0
	httpdate@1.0.3
	humansize@2.1.3
	hyper-rustls@0.27.5
	hyper-timeout@0.5.2
	hyper-tls@0.6.0
	hyper-util@0.1.10
	hyper@0.14.32
	hyper@1.6.0
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
	idlset@0.2.5
	idna@1.0.3
	idna_adapter@1.2.0
	image@0.23.14
	image@0.24.9
	indexmap@1.9.3
	indexmap@2.7.1
	inotify-sys@0.1.5
	inotify@0.9.6
	ipnet@2.11.0
	is_terminal_polyfill@1.70.1
	itertools@0.10.5
	itertools@0.13.0
	itoa@1.0.14
	jpeg-decoder@0.3.1
	js-sys@0.3.77
	jsonschema@0.29.0
	kanidm-hsm-crypto@0.2.0
	kqueue-sys@1.0.4
	kqueue@1.0.8
	lazy_static@1.5.0
	lazycell@1.3.0
	lber@0.4.2
	ldap3_client@0.5.2
	ldap3_proto@0.5.2
	libc@0.2.169
	libloading@0.8.6
	libm@0.2.11
	libmimalloc-sys@0.1.39
	libredox@0.1.3
	libsqlite3-sys@0.25.2
	libudev-sys@0.1.4
	libudev@0.2.0
	linux-raw-sys@0.4.15
	litemap@0.7.4
	litrs@0.4.1
	lock_api@0.4.12
	lodepng@3.11.0
	log@0.4.25
	lru@0.12.5
	malloced@1.3.1
	matchers@0.1.0
	matchit@0.7.3
	mathru@0.13.0
	memchr@2.7.4
	memmap2@0.9.5
	memoffset@0.8.0
	mimalloc@0.1.43
	mime@0.3.17
	mime_guess@2.0.5
	minimal-lexical@0.2.1
	miniz_oxide@0.8.3
	mintex@0.1.3
	mio@0.8.11
	mio@1.0.3
	multer@3.1.0
	native-tls@0.2.13
	nix@0.29.0
	nom@7.1.3
	nonempty@0.8.1
	notify-debouncer-full@0.1.0
	notify@6.1.1
	nu-ansi-term@0.46.0
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
	num@0.4.3
	num_enum@0.5.11
	num_enum_derive@0.5.11
	num_threads@0.1.7
	oauth2@4.4.2
	oauth2@5.0.0
	object@0.36.7
	oid-registry@0.7.1
	oid@0.2.1
	once_cell@1.20.3
	openssl-macros@0.1.1
	openssl-probe@0.1.6
	openssl-sys@0.9.105
	openssl@0.10.70
	opentelemetry-http@0.27.0
	opentelemetry-otlp@0.27.0
	opentelemetry-proto@0.27.0
	opentelemetry-semantic-conventions@0.27.0
	opentelemetry@0.27.1
	opentelemetry_sdk@0.27.1
	outref@0.5.2
	overload@0.1.1
	parking_lot@0.12.3
	parking_lot_core@0.9.10
	password-hash@0.5.0
	paste@1.0.15
	peeking_take_while@0.1.2
	peg-macros@0.8.4
	peg-runtime@0.8.3
	peg@0.8.4
	pem-rfc7468@0.7.0
	percent-encoding@2.3.1
	petgraph@0.7.1
	picky-asn1-der@0.4.1
	picky-asn1-x509@0.12.0
	picky-asn1@0.8.0
	pin-project-internal@1.1.9
	pin-project-lite@0.2.16
	pin-project@1.1.9
	pin-utils@0.1.0
	pkg-config@0.3.31
	powerfmt@0.2.0
	ppv-lite86@0.2.20
	prctl@1.0.0
	prettyplease@0.2.29
	proc-macro-crate@1.3.1
	proc-macro-error-attr@1.0.4
	proc-macro-error@1.0.4
	proc-macro2@1.0.93
	prodash@28.0.0
	prost-derive@0.13.4
	prost@0.13.4
	psl-types@2.0.11
	publicsuffix@2.3.0
	qrcode@0.12.0
	quick-error@2.0.1
	quinn-proto@0.11.9
	quinn-udp@0.5.9
	quinn@0.11.6
	quote@1.0.38
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	redox_syscall@0.5.8
	redox_users@0.4.6
	ref-cast-impl@1.0.23
	ref-cast@1.0.23
	reference-counted-singleton@0.1.5
	referencing@0.29.0
	regex-automata@0.1.10
	regex-automata@0.4.9
	regex-syntax@0.6.29
	regex-syntax@0.8.5
	regex@1.11.1
	reqwest@0.11.27
	reqwest@0.12.12
	rgb@0.8.50
	ring@0.17.8
	rpassword@5.0.1
	runloop@0.1.0
	rusqlite@0.28.0
	rust-embed-impl@8.5.0
	rust-embed-utils@8.5.0
	rust-embed@8.5.0
	rustc-demangle@0.1.24
	rustc-hash@1.1.0
	rustc-hash@2.1.1
	rusticata-macros@4.1.0
	rustix@0.38.44
	rustls-native-certs@0.8.1
	rustls-pemfile@2.2.0
	rustls-pki-types@1.11.0
	rustls-webpki@0.102.8
	rustls@0.23.22
	rustversion@1.0.19
	ryu@1.0.19
	same-file@1.0.6
	schannel@0.1.27
	scopeguard@1.2.0
	sd-notify@0.4.5
	security-framework-sys@2.14.0
	security-framework@2.11.1
	security-framework@3.2.0
	selinux-sys@0.6.13
	selinux@0.4.6
	semver@1.0.25
	serde@1.0.217
	serde_bytes@0.11.15
	serde_cbor@0.11.2
	serde_cbor_2@0.12.0-dev
	serde_derive@1.0.217
	serde_json@1.0.138
	serde_path_to_error@0.1.16
	serde_urlencoded@0.7.1
	serde_with@3.12.0
	serde_with_macros@3.12.0
	sha-crypt@0.5.0
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
	socket2@0.5.8
	spin@0.9.8
	spki@0.7.3
	sptr@0.3.2
	sshkey-attest@0.5.0
	sshkeys@0.3.3
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	strsim@0.10.0
	strsim@0.11.1
	subtle@2.6.1
	svg@0.13.1
	syn@1.0.109
	syn@2.0.98
	sync_wrapper@0.1.2
	sync_wrapper@1.0.2
	synstructure@0.13.1
	system-configuration-sys@0.5.0
	system-configuration@0.5.1
	target-lexicon@0.12.16
	tempfile@3.16.0
	thiserror-impl@1.0.69
	thiserror-impl@2.0.11
	thiserror@1.0.69
	thiserror@2.0.11
	thousands@0.2.0
	thread_local@1.1.8
	time-core@0.1.2
	time-macros@0.2.19
	time@0.3.37
	tinystr@0.7.6
	tinyvec@1.8.1
	tinyvec_macros@0.1.1
	tls_codec@0.4.1
	tls_codec_derive@0.4.1
	tokio-macros@2.5.0
	tokio-native-tls@0.3.1
	tokio-openssl@0.6.5
	tokio-rustls@0.26.1
	tokio-stream@0.1.17
	tokio-util@0.7.13
	tokio@1.43.0
	toml@0.5.11
	toml_datetime@0.6.8
	toml_edit@0.19.15
	tonic@0.12.3
	tower-http@0.6.2
	tower-layer@0.3.3
	tower-service@0.3.3
	tower@0.4.13
	tower@0.5.2
	tracing-attributes@0.1.28
	tracing-core@0.1.33
	tracing-forest@0.1.6
	tracing-log@0.2.0
	tracing-opentelemetry@0.28.0
	tracing-subscriber@0.3.19
	tracing@0.1.41
	try-lock@0.2.5
	tss-esapi-sys@0.5.0
	tss-esapi@8.0.0-alpha
	typenum@1.17.0
	unicase@2.8.1
	unicode-bom@2.0.3
	unicode-ident@1.0.16
	unicode-normalization@0.1.24
	unicode-segmentation@1.12.0
	unicode-width@0.2.0
	untrusted@0.9.0
	url@2.5.4
	urlencoding@2.1.3
	utf16_iter@1.0.5
	utf8_iter@1.0.4
	utf8parse@0.2.2
	utoipa-gen@4.3.1
	utoipa-swagger-ui@6.0.0
	utoipa@4.2.3
	uuid-simd@0.8.0
	uuid@1.13.1
	valuable@0.1.1
	vcpkg@0.2.15
	version_check@0.9.5
	vsimd@0.8.0
	walkdir@2.5.0
	want@0.3.1
	wasi@0.11.0+wasi-snapshot-preview1
	wasi@0.13.3+wasi-0.2.2
	wasite@0.1.0
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-futures@0.4.50
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	web-sys@0.3.77
	web-time@1.1.0
	webauthn-attestation-ca@0.5.1
	webauthn-authenticator-rs@0.5.1
	webauthn-rs-core@0.5.1
	webauthn-rs-proto@0.5.1
	webauthn-rs@0.5.1
	webdriver@0.50.0
	webpki-roots@0.26.8
	weezl@0.1.8
	which@4.4.2
	whoami@1.5.2
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.9
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-core@0.52.0
	windows-registry@0.2.0
	windows-result@0.2.0
	windows-strings@0.1.0
	windows-sys@0.48.0
	windows-sys@0.52.0
	windows-sys@0.59.0
	windows-targets@0.48.5
	windows-targets@0.52.6
	windows@0.41.0
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
	winnow@0.6.26
	winreg@0.50.0
	wit-bindgen-rt@0.33.0
	write16@1.0.0
	writeable@0.5.5
	x509-cert@0.2.5
	x509-parser@0.16.0
	yoke-derive@0.7.5
	yoke@0.7.5
	zerocopy-derive@0.7.35
	zerocopy@0.7.35
	zerofrom-derive@0.1.5
	zerofrom@0.1.5
	zeroize@1.8.1
	zeroize_derive@1.4.2
	zerovec-derive@0.10.3
	zerovec@0.10.4
	zip@0.6.6
	zxcvbn@2.2.2
"

declare -A GIT_CRATES=(
	[libnss]='https://github.com/Firstyear/libnss-rs;763da4beaadc1e475b89ed876de31a5e393f6d30;libnss-rs-%commit%/libnss'
)

inherit bash-completion-r1 cargo pam systemd

MY_PV="${PV/rc/rc.}"
MY_PV="${MY_PV/_/-}"
MY_P="kanidm-${MY_PV}"

DESCRIPTION="Kanidm Unix Integration Clients"
HOMEPAGE="https://kanidm.com https://github.com/kanidm/kanidm"
SRC_URI="https://github.com/kanidm/kanidm/archive/v${MY_PV}.tar.gz -> kanidm-${PV}.tar.gz"
SRC_URI+=" $(cargo_crate_uris)"

LICENSE="MPL-2.0"
# Dependent crate licenses
LICENSE+="
	0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD CC0-1.0 ISC
	LGPL-3 MIT MIT-0 MPL-2.0 MPL-2.0 Unicode-DFS-2016 ZLIB
"
SLOT="0"
KEYWORDS="~amd64"

IUSE="doc selinux tpm"
PDEPEND="doc? ( ~app-doc/kanidm-docs-${PV} )"
RDEPEND="
	acct-user/kanidm-unixd
	~net-nds/kanidm-clients-${PV}
	dev-libs/openssl:=
	sys-libs/pam
	virtual/udev
	tpm? ( app-crypt/tpm2-tss:0= )
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

	local features="unix"
	use selinux && features+=",selinux"
	use tpm && features+=",tpm"

	export KANIDM_BUILD_PROFILE=release_linux
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
	dosbin "$(cargo_target_dir)"/kanidm_ssh_authorizedkeys
	dosbin "$(cargo_target_dir)"/kanidm_ssh_authorizedkeys_direct

	newlib.so "$(cargo_target_dir)"/libnss_kanidm.so libnss_kanidm.so.2
	newpammod "$(cargo_target_dir)"/libpam_kanidm.so pam_kanidm.so

	dosbin "$(cargo_target_dir)"/kanidm_unixd
	dosbin "$(cargo_target_dir)"/kanidm_unixd_tasks
	dobin "$(cargo_target_dir)"/kanidm-unix

	insinto /etc/kanidm
	doins examples/unixd

	newconfd "${FILESDIR}/kanidm-unixd.confd" kanidm-unixd

	newinitd "${FILESDIR}/kanidm-unixd.initd" kanidm-unixd
	systemd_dounit platform/opensuse/kanidm-unixd.service
	systemd_dounit platform/opensuse/kanidm-unixd-tasks.service
	systemd_install_serviced "${FILESDIR}"/kanidm-unixd.service.conf

	newbashcomp "$(cargo_target_dir)"/build/completions/kanidm_ssh_authorizedkeys.bash kanidm_ssh_authorizedkeys
	newbashcomp "$(cargo_target_dir)"/build/completions/kanidm_ssh_authorizedkeys_direct.bash kanidm_ssh_authorizedkeys_direct
	newbashcomp "$(cargo_target_dir)"/build/completions/kanidm_unix.bash kanidm_unix

	insinto /usr/share/zsh/site-functions
	doins "$(cargo_target_dir)"/build/completions/_kanidm_ssh_authorizedkeys
	doins "$(cargo_target_dir)"/build/completions/_kanidm_ssh_authorizedkeys_direct
	doins "$(cargo_target_dir)"/build/completions/_kanidm_unix
}
