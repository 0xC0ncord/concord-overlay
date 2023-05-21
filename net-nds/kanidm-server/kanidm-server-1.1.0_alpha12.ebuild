# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	adler-1.0.2
	aead-0.3.2
	aes-0.6.0
	aes-gcm-0.8.0
	aes-soft-0.6.4
	aesni-0.10.0
	ahash-0.7.6
	aho-corasick-1.0.1
	android_system_properties-0.1.5
	anes-0.1.6
	anyhow-1.0.70
	anymap2-0.13.0
	arrayref-0.3.7
	arrayvec-0.5.2
	asn1-rs-0.3.1
	asn1-rs-derive-0.1.0
	asn1-rs-impl-0.1.0
	async-channel-1.8.0
	async-compression-0.3.15
	async-dup-1.2.2
	async-executor-1.5.1
	async-global-executor-2.3.1
	async-h1-2.3.3
	async-io-1.13.0
	async-lock-2.7.0
	async-process-1.7.0
	async-session-2.0.1
	async-sse-4.1.0
	async-std-1.12.0
	async-std-openssl-0.6.3
	async-task-4.4.0
	async-trait-0.1.68
	atomic-waker-1.1.1
	atty-0.2.14
	authenticator-ctap2-2021-0.3.2-dev.1
	autocfg-1.1.0
	base-x-0.2.11
	base32-0.4.0
	base64-0.12.3
	base64-0.13.1
	base64-0.21.0
	base64urlsafedata-0.1.3
	bincode-1.3.3
	bit-set-0.5.3
	bit-vec-0.6.3
	bitflags-1.3.2
	blake3-0.3.8
	block-buffer-0.7.3
	block-buffer-0.9.0
	block-buffer-0.10.4
	block-padding-0.1.5
	blocking-1.3.1
	boolinator-2.4.0
	bumpalo-3.12.0
	byte-tools-0.3.1
	bytemuck-1.13.1
	byteorder-1.4.3
	bytes-1.4.0
	cast-0.3.0
	cc-1.0.79
	cfg-if-0.1.10
	cfg-if-1.0.0
	checked_int_cast-1.0.0
	chrono-0.4.24
	ciborium-0.2.0
	ciborium-io-0.2.0
	ciborium-ll-0.2.0
	cipher-0.2.5
	clap-3.2.25
	clap_complete-3.2.5
	clap_derive-3.2.25
	clap_lex-0.2.4
	codespan-reporting-0.11.1
	color_quant-1.1.0
	compact_jwt-0.2.9
	concread-0.4.1
	concurrent-queue-2.2.0
	console-0.15.5
	console_error_panic_hook-0.1.7
	const_fn-0.4.9
	constant_time_eq-0.1.5
	cookie-0.14.4
	cookie-0.16.2
	cookie_store-0.16.1
	core-foundation-0.9.3
	core-foundation-sys-0.8.4
	cpufeatures-0.2.6
	cpuid-bool-0.2.0
	crc32fast-1.3.2
	criterion-0.4.0
	criterion-plot-0.5.0
	cron-0.12.0
	crossbeam-0.8.2
	crossbeam-channel-0.5.8
	crossbeam-deque-0.8.3
	crossbeam-epoch-0.9.14
	crossbeam-queue-0.3.8
	crossbeam-utils-0.8.15
	crypto-common-0.1.6
	crypto-mac-0.8.0
	crypto-mac-0.10.1
	csv-1.2.1
	csv-core-0.1.10
	ctor-0.1.26
	ctr-0.6.0
	cxx-1.0.94
	cxx-build-1.0.94
	cxxbridge-flags-1.0.94
	cxxbridge-macro-1.0.94
	darling-0.14.4
	darling_core-0.14.4
	darling_macro-0.14.4
	data-encoding-2.3.3
	der-parser-7.0.0
	derive_builder-0.12.0
	derive_builder_core-0.12.0
	derive_builder_macro-0.12.0
	devd-rs-0.3.6
	dialoguer-0.10.4
	digest-0.8.1
	digest-0.9.0
	digest-0.10.6
	dirs-4.0.0
	dirs-sys-0.3.7
	discard-1.0.4
	displaydoc-0.2.3
	dyn-clone-1.0.11
	either-1.8.1
	encode_unicode-0.3.6
	encoding_rs-0.8.32
	erased-serde-0.3.25
	errno-0.3.1
	errno-dragonfly-0.1.2
	event-listener-2.5.3
	fake-simd-0.1.2
	fallible-iterator-0.2.0
	fallible-streaming-iterator-0.1.9
	fancy-regex-0.11.0
	fastrand-1.9.0
	femme-2.2.1
	fernet-0.2.1
	filetime-0.2.21
	flate2-1.0.25
	fnv-1.0.7
	foreign-types-0.3.2
	foreign-types-shared-0.1.1
	form_urlencoded-1.1.0
	fs2-0.4.3
	futures-0.3.28
	futures-channel-0.3.28
	futures-concurrency-3.1.0
	futures-core-0.3.28
	futures-executor-0.3.28
	futures-io-0.3.28
	futures-lite-1.13.0
	futures-macro-0.3.28
	futures-sink-0.3.28
	futures-task-0.3.28
	futures-util-0.3.28
	generic-array-0.12.4
	generic-array-0.14.7
	getrandom-0.1.16
	getrandom-0.2.9
	ghash-0.3.1
	git2-0.13.25
	gloo-0.8.0
	gloo-console-0.2.3
	gloo-dialogs-0.1.1
	gloo-events-0.1.2
	gloo-file-0.2.3
	gloo-history-0.1.3
	gloo-net-0.2.6
	gloo-render-0.1.1
	gloo-storage-0.2.2
	gloo-timers-0.2.6
	gloo-utils-0.1.6
	gloo-worker-0.2.1
	h2-0.3.18
	half-1.8.2
	hashbrown-0.12.3
	hashlink-0.8.1
	heck-0.4.1
	hermit-abi-0.1.19
	hermit-abi-0.2.6
	hermit-abi-0.3.1
	hex-0.4.3
	hkdf-0.10.0
	hmac-0.8.1
	hmac-0.10.1
	http-0.2.9
	http-body-0.4.5
	http-client-6.5.3
	http-types-2.12.0
	httparse-1.8.0
	httpdate-1.0.2
	hyper-0.14.26
	hyper-tls-0.5.0
	iana-time-zone-0.1.56
	iana-time-zone-haiku-0.1.1
	ident_case-1.0.1
	idlset-0.2.4
	idna-0.2.3
	idna-0.3.0
	image-0.23.14
	implicit-clone-0.3.5
	indexmap-1.9.3
	infer-0.2.3
	instant-0.1.12
	io-lifetimes-1.0.10
	ipnet-2.7.2
	itertools-0.10.5
	itoa-1.0.6
	jobserver-0.1.26
	js-sys-0.3.61
	kv-log-macro-1.0.7
	last-git-commit-0.2.0
	lazy_static-1.4.0
	lber-0.4.0
	ldap3_client-0.3.2
	ldap3_proto-0.3.2
	libc-0.2.142
	libgit2-sys-0.12.26+1.3.0
	libnss-0.4.0
	libsqlite3-sys-0.25.2
	libssh2-sys-0.2.23
	libudev-0.2.0
	libudev-sys-0.1.4
	libz-sys-1.1.8
	link-cplusplus-1.0.8
	linux-raw-sys-0.3.3
	lock_api-0.4.9
	log-0.4.17
	lru-0.7.8
	lru-0.8.1
	matchers-0.1.0
	matches-0.1.10
	mathru-0.13.0
	memchr-2.5.0
	memoffset-0.6.5
	memoffset-0.8.0
	mime-0.3.17
	minimal-lexical-0.2.1
	miniz_oxide-0.6.2
	mio-0.8.6
	native-tls-0.2.11
	nom-7.1.3
	nonempty-0.8.1
	nu-ansi-term-0.46.0
	num-bigint-0.4.3
	num-integer-0.1.45
	num-iter-0.1.43
	num-rational-0.3.2
	num-traits-0.2.15
	num_cpus-1.15.0
	num_enum-0.5.11
	num_enum_derive-0.5.11
	oauth2-4.3.0
	oid-registry-0.4.0
	once_cell-1.17.1
	oorandom-11.1.3
	opaque-debug-0.2.3
	opaque-debug-0.3.0
	openssl-0.10.52
	openssl-macros-0.1.1
	openssl-probe-0.1.5
	openssl-sys-0.9.87
	os_str_bytes-6.5.0
	overload-0.1.1
	parking-2.1.0
	parking_lot-0.12.1
	parking_lot_core-0.9.7
	paste-0.1.18
	paste-1.0.12
	paste-impl-0.1.18
	peg-0.8.1
	peg-macros-0.8.1
	peg-runtime-0.8.1
	percent-encoding-2.2.0
	pin-project-1.0.12
	pin-project-internal-1.0.12
	pin-project-lite-0.1.12
	pin-project-lite-0.2.9
	pin-utils-0.1.0
	pinned-0.1.0
	pkg-config-0.3.26
	plotters-0.3.4
	plotters-backend-0.3.4
	plotters-svg-0.3.3
	polling-2.7.0
	polyval-0.4.5
	ppv-lite86-0.2.17
	prettyplease-0.1.25
	proc-macro-crate-1.3.1
	proc-macro-error-1.0.4
	proc-macro-error-attr-1.0.4
	proc-macro-hack-0.5.20+deprecated
	proc-macro2-1.0.56
	prokio-0.1.0
	psl-types-2.0.11
	publicsuffix-2.2.3
	qrcode-0.12.0
	quick-error-2.0.1
	quote-1.0.26
	r2d2-0.8.10
	r2d2_sqlite-0.21.0
	rand-0.7.3
	rand-0.8.5
	rand_chacha-0.2.2
	rand_chacha-0.3.1
	rand_core-0.5.1
	rand_core-0.6.4
	rand_hc-0.2.0
	rayon-1.7.0
	rayon-core-1.11.0
	redox_syscall-0.2.16
	redox_syscall-0.3.5
	redox_users-0.4.3
	regex-1.8.1
	regex-automata-0.1.10
	regex-syntax-0.6.29
	regex-syntax-0.7.1
	reqwest-0.11.17
	route-recognizer-0.2.0
	route-recognizer-0.3.1
	rpassword-5.0.1
	rpassword-7.2.0
	rtoolbox-0.0.1
	runloop-0.1.0
	rusqlite-0.28.0
	rustc_version-0.2.3
	rusticata-macros-4.1.0
	rustix-0.37.12
	rustversion-1.0.12
	ryu-1.0.13
	same-file-1.0.6
	schannel-0.1.21
	scheduled-thread-pool-0.2.7
	scim_proto-0.1.1
	scoped-tls-1.0.1
	scopeguard-1.1.0
	scratch-1.0.5
	security-framework-2.8.2
	security-framework-sys-2.8.0
	semver-0.9.0
	semver-parser-0.7.0
	serde-1.0.160
	serde-wasm-bindgen-0.4.5
	serde_bytes-0.11.9
	serde_cbor-0.11.2
	serde_cbor_2-0.12.0-dev
	serde_derive-1.0.160
	serde_fmt-1.0.2
	serde_json-1.0.96
	serde_path_to_error-0.1.11
	serde_qs-0.8.5
	serde_urlencoded-0.7.1
	sha1-0.6.1
	sha1_smol-1.0.0
	sha2-0.8.2
	sha2-0.9.9
	sha2-0.10.6
	sharded-slab-0.1.4
	shell-words-1.1.0
	shellexpand-2.1.2
	signal-hook-0.3.15
	signal-hook-registry-1.4.1
	simple-mutex-1.1.5
	slab-0.4.8
	smallvec-1.10.0
	smartstring-1.0.1
	smolset-1.3.1
	socket2-0.4.9
	sptr-0.3.2
	sshkeys-0.3.2
	standback-0.2.17
	static_assertions-1.1.0
	stdweb-0.4.20
	stdweb-derive-0.5.3
	stdweb-internal-macros-0.2.9
	stdweb-internal-runtime-0.1.5
	strsim-0.10.0
	subtle-2.4.1
	sval-1.0.0-alpha.5
	syn-1.0.109
	syn-2.0.15
	synstructure-0.12.6
	tempfile-3.5.0
	termcolor-1.2.0
	textwrap-0.16.0
	thiserror-1.0.40
	thiserror-impl-1.0.40
	thread_local-1.1.7
	tide-0.16.0
	tide-compress-0.10.6
	tide-openssl-0.1.1
	tikv-jemalloc-sys-0.5.3+5.3.0-patched
	tikv-jemallocator-0.5.0
	time-0.1.45
	time-0.2.27
	time-0.3.20
	time-core-0.1.0
	time-macros-0.1.1
	time-macros-0.2.8
	time-macros-impl-0.1.2
	tinytemplate-1.2.1
	tinyvec-1.6.0
	tinyvec_macros-0.1.1
	tokio-1.28.0
	tokio-macros-2.1.0
	tokio-native-tls-0.3.1
	tokio-openssl-0.6.3
	tokio-stream-0.1.12
	tokio-util-0.7.8
	toml-0.5.11
	toml_datetime-0.6.1
	toml_edit-0.19.8
	touch-0.0.1
	tower-service-0.3.2
	tracing-0.1.37
	tracing-attributes-0.1.23
	tracing-core-0.1.30
	tracing-log-0.1.3
	tracing-subscriber-0.3.17
	try-lock-0.2.4
	typenum-1.16.0
	unicode-bidi-0.3.13
	unicode-ident-1.0.8
	unicode-normalization-0.1.22
	unicode-width-0.1.10
	unicode-xid-0.2.4
	universal-hash-0.4.1
	url-2.3.1
	urlencoding-2.1.2
	users-0.11.0
	uuid-1.3.2
	valuable-0.1.0
	value-bag-1.0.0-alpha.9
	vcpkg-0.2.15
	version_check-0.9.4
	waker-fn-1.1.0
	walkdir-2.3.3
	want-0.3.0
	wasi-0.9.0+wasi-snapshot-preview1
	wasi-0.10.0+wasi-snapshot-preview1
	wasi-0.11.0+wasi-snapshot-preview1
	wasm-bindgen-0.2.84
	wasm-bindgen-backend-0.2.84
	wasm-bindgen-futures-0.4.34
	wasm-bindgen-macro-0.2.84
	wasm-bindgen-macro-support-0.2.84
	wasm-bindgen-shared-0.2.84
	wasm-bindgen-test-0.3.34
	wasm-bindgen-test-macro-0.3.34
	web-sys-0.3.61
	webauthn-authenticator-rs-0.4.9
	webauthn-rs-0.4.8
	webauthn-rs-core-0.4.9
	webauthn-rs-proto-0.4.9
	whoami-1.4.0
	winapi-0.3.9
	winapi-i686-pc-windows-gnu-0.4.0
	winapi-util-0.1.5
	winapi-x86_64-pc-windows-gnu-0.4.0
	windows-0.41.0
	windows-0.48.0
	windows-sys-0.42.0
	windows-sys-0.45.0
	windows-sys-0.48.0
	windows-targets-0.42.2
	windows-targets-0.48.0
	windows_aarch64_gnullvm-0.41.0
	windows_aarch64_gnullvm-0.42.2
	windows_aarch64_gnullvm-0.48.0
	windows_aarch64_msvc-0.41.0
	windows_aarch64_msvc-0.42.2
	windows_aarch64_msvc-0.48.0
	windows_i686_gnu-0.41.0
	windows_i686_gnu-0.42.2
	windows_i686_gnu-0.48.0
	windows_i686_msvc-0.41.0
	windows_i686_msvc-0.42.2
	windows_i686_msvc-0.48.0
	windows_x86_64_gnu-0.41.0
	windows_x86_64_gnu-0.42.2
	windows_x86_64_gnu-0.48.0
	windows_x86_64_gnullvm-0.41.0
	windows_x86_64_gnullvm-0.42.2
	windows_x86_64_gnullvm-0.48.0
	windows_x86_64_msvc-0.41.0
	windows_x86_64_msvc-0.42.2
	windows_x86_64_msvc-0.48.0
	winnow-0.4.1
	winreg-0.10.1
	x509-parser-0.13.2
	yew-0.20.0
	yew-macro-0.20.0
	yew-router-0.17.0
	yew-router-macro-0.17.0
	zeroize-1.6.0
	zeroize_derive-1.4.2
	zxcvbn-2.2.2
"

TRACING_FOREST_COMMIT="77daf8c8abf010b87d45ece2bf656983c6f8cecb"
declare -A GIT_CRATES=(
	[tracing-forest]="https://github.com/QnnOkabayashi/tracing-forest;${TRACING_FOREST_COMMIT};tracing-forest-%commit%/tracing-forest"
)

inherit bash-completion-r1 cargo optfeature systemd

MY_PV="${PV/alpha/alpha.}"
MY_PV="${MY_PV/_/-}"
MY_P="kanidm-${MY_PV}"

DESCRIPTION="Kanidm Server Daemon"
HOMEPAGE="https://kanidm.com https://github.com/kanidm/kanidm"
SRC_URI="https://github.com/kanidm/kanidm/archive/v${MY_PV}.tar.gz -> kanidm-${PV}.tar.gz"
SRC_URI+=" $(cargo_crate_uris)"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD BSD-2 BlueOak-1.0.0 Boost-1.0 CC0-1.0 LGPL-3 MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
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
	export KANIDM_BUILD_PROFILE=release_suse_generic
	cargo_src_compile --bin kanidmd
	cargo_src_compile -p kanidm-ipa-sync
}

src_install() {
	dosbin target/release/kanidmd
	dosbin target/release/kanidm-ipa-sync

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

	newbashcomp target/release/build/completions/kanidmd.bash kanidmd

	insinto /usr/share/zsh/site-functions
	doins target/release/build/completions/_kanidmd
}

pkg_postinst() {
	optfeature "clients to administrate the Kanidm Server" net-nds/kanidm-clients
	optfeature "Unix integration clients with the Kanidm Server" net-nds/kanidm-unixd-clients
}
