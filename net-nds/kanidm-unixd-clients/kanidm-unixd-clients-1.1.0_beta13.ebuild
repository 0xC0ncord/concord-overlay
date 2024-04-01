# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	addr2line@0.20.0
	adler@1.0.2
	ahash@0.7.6
	ahash@0.8.3
	aho-corasick@1.0.2
	allocator-api2@0.2.16
	android-tzdata@0.1.1
	android_system_properties@0.1.5
	anes@0.1.6
	anstream@0.3.2
	anstyle@1.0.1
	anstyle-parse@0.2.1
	anstyle-query@1.0.0
	anstyle-wincon@1.0.1
	anymap2@0.13.0
	argon2@0.5.1
	asn1-rs@0.3.1
	asn1-rs-derive@0.1.0
	asn1-rs-impl@0.1.0
	async-compression@0.4.1
	async-recursion@1.0.4
	async-trait@0.1.72
	authenticator-ctap2-2021@0.3.2-dev.1
	autocfg@1.1.0
	axum@0.6.19
	axum-auth@0.4.0
	axum-core@0.3.4
	axum-csp@0.0.5
	axum-macros@0.3.8
	axum-server@0.5.1
	backtrace@0.3.68
	base32@0.4.0
	base64@0.12.3
	base64@0.13.1
	base64@0.21.2
	base64ct@1.6.0
	base64urlsafedata@0.1.3
	bincode@1.3.3
	bindgen@0.65.1
	bit-set@0.5.3
	bit-vec@0.6.3
	bitfield@0.13.2
	bitflags@1.3.2
	bitflags@2.3.3
	blake2@0.10.6
	block-buffer@0.7.3
	block-buffer@0.10.4
	block-padding@0.1.5
	boolinator@2.4.0
	bumpalo@3.13.0
	byte-tools@0.3.1
	bytemuck@1.13.1
	byteorder@1.4.3
	bytes@1.4.0
	cast@0.3.0
	cc@1.0.79
	cexpr@0.6.0
	cfg-if@1.0.0
	checked_int_cast@1.0.0
	chrono@0.4.26
	ciborium@0.2.1
	ciborium-io@0.2.1
	ciborium-ll@0.2.1
	clang-sys@1.6.1
	clap@4.3.19
	clap_builder@4.3.19
	clap_complete@4.3.2
	clap_derive@4.3.12
	clap_lex@0.5.0
	color_quant@1.1.0
	colorchoice@1.0.0
	compact_jwt@0.2.9
	concread@0.4.2
	console@0.15.7
	console_error_panic_hook@0.1.7
	cookie@0.16.2
	cookie_store@0.16.2
	core-foundation@0.9.3
	core-foundation-sys@0.8.4
	cpufeatures@0.2.9
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
	crypto-common@0.1.6
	csv@1.2.2
	csv-core@0.1.10
	darling@0.14.4
	darling_core@0.14.4
	darling_macro@0.14.4
	data-encoding@2.4.0
	der-parser@7.0.0
	deranged@0.3.6
	derive_builder@0.12.0
	derive_builder_core@0.12.0
	derive_builder_macro@0.12.0
	devd-rs@0.3.6
	dialoguer@0.10.4
	digest@0.8.1
	digest@0.10.7
	dirs@4.0.0
	dirs-sys@0.3.7
	displaydoc@0.2.4
	dunce@1.0.4
	dyn-clone@1.0.12
	either@1.9.0
	encode_unicode@0.3.6
	encoding_rs@0.8.32
	enumflags2@0.7.7
	enumflags2_derive@0.7.7
	equivalent@1.0.1
	errno@0.3.2
	errno-dragonfly@0.1.2
	fake-simd@0.1.2
	fallible-iterator@0.2.0
	fallible-streaming-iterator@0.1.9
	fancy-regex@0.11.0
	fantoccini@0.19.3
	fastrand@2.0.0
	fernet@0.2.1
	file-id@0.1.0
	filetime@0.2.21
	flate2@1.0.26
	fnv@1.0.7
	foreign-types@0.3.2
	foreign-types-shared@0.1.1
	form_urlencoded@1.2.0
	fs2@0.4.3
	fsevent-sys@4.1.0
	futures@0.3.28
	futures-channel@0.3.28
	futures-concurrency@3.1.0
	futures-core@0.3.28
	futures-executor@0.3.28
	futures-io@0.3.28
	futures-macro@0.3.28
	futures-sink@0.3.28
	futures-task@0.3.28
	futures-util@0.3.28
	generic-array@0.12.4
	generic-array@0.14.7
	getrandom@0.2.10
	gimli@0.27.3
	git2@0.17.2
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
	gloo-utils@0.1.7
	gloo-worker@0.2.1
	h2@0.3.20
	half@1.8.2
	hashbrown@0.12.3
	hashbrown@0.14.0
	hashlink@0.8.3
	headers@0.3.8
	headers-core@0.2.0
	heck@0.4.1
	hermit-abi@0.3.2
	hex@0.4.3
	hostname-validator@1.1.1
	http@0.2.9
	http-body@0.4.5
	http-range-header@0.3.1
	httparse@1.8.0
	httpdate@1.0.2
	hyper@0.14.27
	hyper-tls@0.5.0
	iana-time-zone@0.1.57
	iana-time-zone-haiku@0.1.2
	ident_case@1.0.1
	idlset@0.2.4
	idna@0.2.3
	idna@0.3.0
	idna@0.4.0
	image@0.23.14
	implicit-clone@0.3.6
	indexmap@1.9.3
	indexmap@2.0.0
	inotify@0.9.6
	inotify-sys@0.1.5
	ipnet@2.8.0
	is-terminal@0.4.9
	itertools@0.10.5
	itoa@1.0.9
	jobserver@0.1.26
	js-sys@0.3.64
	kqueue@1.0.7
	kqueue-sys@1.0.3
	lazy_static@1.4.0
	lazycell@1.3.0
	lber@0.4.2
	ldap3_client@0.3.5
	ldap3_proto@0.3.5
	libc@0.2.147
	libgit2-sys@0.15.2+1.6.4
	libloading@0.7.4
	libnss@0.4.0
	libsqlite3-sys@0.25.2
	libssh2-sys@0.3.0
	libudev@0.2.0
	libudev-sys@0.1.4
	libz-sys@1.1.12
	linux-raw-sys@0.4.5
	lock_api@0.4.10
	log@0.4.19
	lru@0.7.8
	lru@0.8.1
	matchers@0.1.0
	matches@0.1.10
	matchit@0.7.1
	mathru@0.13.0
	mbox@0.6.0
	memchr@2.5.0
	memoffset@0.6.5
	memoffset@0.9.0
	mime@0.3.17
	mime_guess@2.0.4
	minimal-lexical@0.2.1
	miniz_oxide@0.7.1
	mio@0.8.8
	native-tls@0.2.11
	nom@7.1.3
	nonempty@0.8.1
	notify@6.0.1
	notify-debouncer-full@0.1.0
	nu-ansi-term@0.46.0
	num-bigint@0.4.3
	num-derive@0.3.3
	num-integer@0.1.45
	num-iter@0.1.43
	num-rational@0.3.2
	num-traits@0.2.16
	num_cpus@1.16.0
	num_enum@0.5.11
	num_enum_derive@0.5.11
	num_threads@0.1.6
	oauth2@4.4.1
	object@0.31.1
	oid@0.2.1
	oid-registry@0.4.0
	once_cell@1.18.0
	oorandom@11.1.3
	opaque-debug@0.2.3
	openssl@0.10.55
	openssl-macros@0.1.1
	openssl-probe@0.1.5
	openssl-sys@0.9.90
	overload@0.1.1
	parking_lot@0.12.1
	parking_lot_core@0.9.8
	password-hash@0.5.0
	paste@0.1.18
	paste@1.0.14
	paste-impl@0.1.18
	peeking_take_while@0.1.2
	peg@0.8.1
	peg-macros@0.8.1
	peg-runtime@0.8.1
	percent-encoding@2.3.0
	pest@2.7.1
	picky-asn1@0.3.3
	picky-asn1-der@0.2.5
	picky-asn1-x509@0.6.1
	pin-project@1.1.2
	pin-project-internal@1.1.2
	pin-project-lite@0.2.10
	pin-utils@0.1.0
	pinned@0.1.0
	pkg-config@0.3.27
	plotters@0.3.5
	plotters-backend@0.3.5
	plotters-svg@0.3.5
	ppv-lite86@0.2.17
	prettyplease@0.1.25
	prettyplease@0.2.12
	proc-macro-crate@1.3.1
	proc-macro-error@1.0.4
	proc-macro-error-attr@1.0.4
	proc-macro-hack@0.5.20+deprecated
	proc-macro2@1.0.66
	prokio@0.1.0
	psl-types@2.0.11
	publicsuffix@2.2.3
	qrcode@0.12.0
	quick-error@2.0.1
	quote@1.0.32
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rayon@1.7.0
	rayon-core@1.11.0
	redox_syscall@0.2.16
	redox_syscall@0.3.5
	redox_users@0.4.3
	reference-counted-singleton@0.1.2
	regex@1.9.1
	regex-automata@0.1.10
	regex-automata@0.3.4
	regex-syntax@0.6.29
	regex-syntax@0.7.4
	reqwest@0.11.18
	route-recognizer@0.3.1
	rpassword@5.0.1
	rpassword@7.2.0
	rtoolbox@0.0.1
	runloop@0.1.0
	rusqlite@0.28.0
	rustc-demangle@0.1.23
	rustc-hash@1.1.0
	rustc_version@0.3.3
	rusticata-macros@4.1.0
	rustix@0.38.4
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
	selinux@0.4.1
	selinux-sys@0.6.5
	semver@0.11.0
	semver-parser@0.10.2
	serde@1.0.180
	serde-wasm-bindgen@0.4.5
	serde-wasm-bindgen@0.5.0
	serde_bytes@0.11.12
	serde_cbor@0.11.2
	serde_cbor_2@0.12.0-dev
	serde_derive@1.0.180
	serde_json@1.0.104
	serde_path_to_error@0.1.14
	serde_urlencoded@0.7.1
	sha1@0.10.5
	sha2@0.8.2
	sha2@0.10.7
	sharded-slab@0.1.4
	shell-words@1.1.0
	shellexpand@2.1.2
	shlex@1.1.0
	signal-hook-registry@1.4.1
	slab@0.4.8
	smallvec@1.11.0
	smartstring@1.0.1
	smolset@1.3.1
	socket2@0.4.9
	sptr@0.3.2
	sshkeys@0.3.2
	stable_deref_trait@1.2.0
	static_assertions@1.1.0
	strsim@0.10.0
	subtle@2.5.0
	syn@1.0.109
	syn@2.0.28
	sync_wrapper@0.1.2
	synstructure@0.12.6
	target-lexicon@0.12.11
	tempfile@3.7.0
	thiserror@1.0.44
	thiserror-impl@1.0.44
	thread_local@1.1.7
	tikv-jemalloc-sys@0.5.4+5.3.0-patched
	tikv-jemallocator@0.5.4
	time@0.1.45
	time@0.3.24
	time-core@0.1.1
	time-macros@0.2.11
	tinytemplate@1.2.1
	tinyvec@1.6.0
	tinyvec_macros@0.1.1
	tokio@1.29.1
	tokio-macros@2.1.0
	tokio-native-tls@0.3.1
	tokio-openssl@0.6.3
	tokio-stream@0.1.14
	tokio-util@0.7.8
	toml@0.5.11
	toml_datetime@0.6.3
	toml_edit@0.19.14
	touch@0.0.1
	tower@0.4.13
	tower-http@0.4.3
	tower-layer@0.3.2
	tower-service@0.3.2
	tracing@0.1.37
	tracing-attributes@0.1.26
	tracing-core@0.1.31
	tracing-forest@0.1.6
	tracing-log@0.1.3
	tracing-serde@0.1.3
	tracing-subscriber@0.3.17
	try-lock@0.2.4
	tss-esapi@7.2.0
	tss-esapi-sys@0.4.0
	typenum@1.16.0
	ucd-trie@0.1.6
	unicase@2.6.0
	unicode-bidi@0.3.13
	unicode-ident@1.0.11
	unicode-normalization@0.1.22
	unicode-segmentation@1.10.1
	unicode-width@0.1.10
	unicode-xid@0.2.4
	url@2.4.0
	urlencoding@2.1.3
	users@0.11.0
	utf8parse@0.2.1
	uuid@1.4.1
	valuable@0.1.0
	vcpkg@0.2.15
	version_check@0.9.4
	walkdir@2.3.3
	want@0.3.1
	wasi@0.10.0+wasi-snapshot-preview1
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen@0.2.87
	wasm-bindgen-backend@0.2.87
	wasm-bindgen-futures@0.4.37
	wasm-bindgen-macro@0.2.87
	wasm-bindgen-macro-support@0.2.87
	wasm-bindgen-shared@0.2.87
	wasm-bindgen-test@0.3.37
	wasm-bindgen-test-macro@0.3.37
	web-sys@0.3.64
	webauthn-authenticator-rs@0.4.9
	webauthn-rs@0.4.8
	webauthn-rs-core@0.4.9
	webauthn-rs-proto@0.4.9
	webdriver@0.46.0
	which@4.4.0
	whoami@1.4.1
	winapi@0.3.9
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.5
	winapi-x86_64-pc-windows-gnu@0.4.0
	windows@0.41.0
	windows@0.48.0
	windows-sys@0.45.0
	windows-sys@0.48.0
	windows-targets@0.42.2
	windows-targets@0.48.1
	windows_aarch64_gnullvm@0.41.0
	windows_aarch64_gnullvm@0.42.2
	windows_aarch64_gnullvm@0.48.0
	windows_aarch64_msvc@0.41.0
	windows_aarch64_msvc@0.42.2
	windows_aarch64_msvc@0.48.0
	windows_i686_gnu@0.41.0
	windows_i686_gnu@0.42.2
	windows_i686_gnu@0.48.0
	windows_i686_msvc@0.41.0
	windows_i686_msvc@0.42.2
	windows_i686_msvc@0.48.0
	windows_x86_64_gnu@0.41.0
	windows_x86_64_gnu@0.42.2
	windows_x86_64_gnu@0.48.0
	windows_x86_64_gnullvm@0.41.0
	windows_x86_64_gnullvm@0.42.2
	windows_x86_64_gnullvm@0.48.0
	windows_x86_64_msvc@0.41.0
	windows_x86_64_msvc@0.42.2
	windows_x86_64_msvc@0.48.0
	winnow@0.5.2
	winreg@0.10.1
	x509-parser@0.13.2
	yew@0.20.0
	yew-macro@0.20.0
	yew-router@0.17.0
	yew-router-macro@0.17.0
	zeroize@1.6.0
	zeroize_derive@1.4.2
	zstd@0.12.4
	zstd-safe@6.0.6
	zstd-sys@2.0.8+zstd.1.5.5
	zxcvbn@2.2.2
"

inherit bash-completion-r1 cargo pam systemd

MY_PV="${PV/beta/beta.}"
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

PATCHES="${FILESDIR}/${P}_users-crate.patch"

QA_FLAGS_IGNORED="usr/bin/.*"

S="${WORKDIR}/${MY_P}"

src_compile() {
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
