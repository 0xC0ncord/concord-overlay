# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	aho-corasick@1.1.3
	allocator-api2@0.2.21
	annotate-snippets@0.11.5
	anstyle@1.0.10
	anyhow@1.0.98
	atomic-traits@0.4.0
	bindgen@0.71.1
	bitflags@2.9.0
	bitvec@1.0.1
	byteorder@1.5.0
	cargo_toml@0.22.1
	cc@1.2.22
	cee-scape@0.2.0
	cexpr@0.6.0
	cfg-if@1.0.0
	clang-sys@1.8.1
	convert_case@0.8.0
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.3
	darling@0.20.11
	darling_core@0.20.11
	darling_macro@0.20.11
	displaydoc@0.2.5
	either@1.15.0
	enum-map-derive@0.17.0
	enum-map@2.7.3
	equivalent@1.0.2
	eyre@0.6.12
	fixedbitset@0.5.7
	fnv@1.0.7
	foldhash@0.1.5
	form_urlencoded@1.2.1
	funty@2.0.0
	getrandom@0.3.3
	glob@0.3.2
	half@1.8.3
	half@2.6.0
	hash32@0.3.1
	hashbrown@0.15.3
	heapless@0.8.0
	hermit-abi@0.5.1
	home@0.5.11
	icu_collections@2.0.0
	icu_locale_core@2.0.0
	icu_normalizer@2.0.0
	icu_normalizer_data@2.0.0
	icu_properties@2.0.0
	icu_properties_data@2.0.0
	icu_provider@2.0.0
	ident_case@1.0.1
	idna@1.0.3
	idna_adapter@1.2.1
	indenter@0.3.3
	indexmap@2.9.0
	is-terminal@0.4.16
	is_ci@1.2.0
	itertools@0.13.0
	itoa@1.0.15
	jemalloc-sys@0.5.4+5.3.0-patched
	jemallocator@0.5.4
	libc@0.2.172
	libloading@0.8.7
	litemap@0.8.0
	memchr@2.7.4
	minimal-lexical@0.2.1
	nom@7.1.3
	once_cell@1.21.3
	owo-colors@4.2.0
	paste@1.0.15
	pathsearch@0.2.0
	percent-encoding@2.3.1
	petgraph@0.8.1
	pgrx-bindgen@0.14.1
	pgrx-catalog@0.2.0
	pgrx-macros@0.14.1
	pgrx-pg-config@0.14.1
	pgrx-pg-sys@0.14.1
	pgrx-sql-entity-graph@0.14.1
	pgrx@0.14.1
	pin-project-internal@1.1.10
	pin-project@1.1.10
	potential_utf@0.1.2
	ppv-lite86@0.2.21
	proc-macro-error-attr2@2.0.0
	proc-macro-error2@2.0.1
	proc-macro2@1.0.95
	quote@1.0.40
	r-efi@5.2.0
	radium@0.7.0
	rand@0.9.1
	rand_chacha@0.9.0
	rand_core@0.9.3
	rayon-core@1.12.1
	rayon@1.10.0
	regex-automata@0.4.9
	regex-syntax@0.8.5
	regex@1.11.1
	rustc-hash@2.1.1
	rustc_version@0.4.1
	ryu@1.0.20
	same-file@1.0.6
	seahash@4.1.0
	semver@1.0.26
	seq-macro@0.3.6
	serde@1.0.219
	serde_cbor@0.11.2
	serde_derive@1.0.219
	serde_json@1.0.140
	serde_spanned@0.6.8
	shlex@1.3.0
	smallvec@1.15.0
	sptr@0.3.2
	stable_deref_trait@1.2.0
	strsim@0.11.1
	supports-color@2.1.0
	supports-color@3.0.2
	syn@2.0.101
	synstructure@0.13.2
	tap@1.0.1
	thiserror-impl@2.0.12
	thiserror@2.0.12
	tinystr@0.8.1
	toml@0.8.22
	toml_datetime@0.6.9
	toml_edit@0.22.26
	toml_write@0.1.1
	unescape@0.1.0
	unicode-ident@1.0.18
	unicode-segmentation@1.12.0
	unicode-width@0.2.0
	url@2.5.4
	utf8_iter@1.0.4
	uuid@1.16.0
	validator@0.20.0
	validator_derive@0.20.0
	walkdir@2.5.0
	wasi@0.14.2+wasi-0.2.4
	winapi-util@0.1.9
	windows-sys@0.59.0
	windows-targets@0.52.6
	windows-targets@0.53.0
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.0
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.0
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.0
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.0
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.0
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.0
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.0
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.0
	winnow@0.7.10
	wit-bindgen-rt@0.39.0
	writeable@0.6.1
	wyz@0.5.1
	yoke-derive@0.8.0
	yoke@0.8.0
	zerocopy-derive@0.8.25
	zerocopy@0.8.25
	zerofrom-derive@0.1.6
	zerofrom@0.1.6
	zerotrie@0.2.2
	zerovec-derive@0.11.1
	zerovec@0.11.2
"

RUST_MIN_VER=1.85.0
RUST_REQ_USE=(nightly rustfmt)

POSTGRES_COMPAT=( {14..17} )
POSTGRES_USEDEP="server"

inherit cargo flag-o-matic postgres-multi

MY_PN="VectorChord"

DESCRIPTION="Scalable, fast, and disk-friendly vector search in Postgres."
HOMEPAGE="https://github.com/tensorchord/VectorChord"
SRC_URI="https://github.com/tensorchord/${MY_PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI+=" ${CARGO_CRATE_URIS}"

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_PN}-${PV}"

DEPEND="
	dev-db/pgvector[${POSTGRES_TARGETS}]
	${POSTGRES_DEP}
"
RDEPEND="${DEPEND}"
BDEPEND="=dev-util/cargo-pgrx-0.14.1"

src_prepare() {
	eapply_user

	# Can't pass host flags
	filter-flags '-mcpu=*' '-march=*' '-mtune=*'

	postgres-multi_src_prepare
	rust_pkg_setup
}

src_compile() {
	vectors_build() {
		cargo_env cargo pgrx init --pg"${PG_SLOT}" "${PG_CONFIG}" || die Failed setting up pgrx for pg slot "${PG_SLOT}"
		cargo_src_compile --features pg"${PG_SLOT}" || die Failed building for pg slot "${PG_SLOT}"
	}

	postgres-multi_foreach vectors_build
}

src_install() {
	vectors_install() {
		insinto "$(${PG_CONFIG} --pkglibdir)"
		newins "$(cargo_target_dir)"/libvectors.so vectors.so
		fperms 0755 "$(${PG_CONFIG} --pkglibdir)"/vectors.so

		insinto "$(${PG_CONFIG} --sharedir)"/extension
		doins sql/install/vectors--* sql/upgrade/vectors--* vectors.control
	}

	postgres-multi_foreach vectors_install
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		echo
		elog Install the vectors extension with the following PSQL commands:
		elog
		elog ALTER SYSTEM SET shared_preload_libraries = \"vectors.so\"
		elog ALTER SYSTEM SET search_path TO \"\$user\", public, vectors
		elog
		elog Then restart your PostgreSQL cluster.
	fi
}
