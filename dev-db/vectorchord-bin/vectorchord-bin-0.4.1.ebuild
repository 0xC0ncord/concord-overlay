# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

POSTGRES_COMPAT=( {13..17} )
POSTGRES_USEDEP="server"

inherit postgres-multi

MY_PN="VectorChord"

DESCRIPTION="Scalable, fast, and disk-friendly vector search in Postgres"
HOMEPAGE="https://github.com/tensorchord/VectorChord"
for pg_slot in ${POSTGRES_COMPAT[@]}; do
	SRC_URI+=" https://github.com/tensorchord/VectorChord/releases/download/${PV}/postgresql-${pg_slot}-vchord_${PV}_x86_64-linux-gnu.zip
		-> ${P}-pg${pg_slot}.zip"
done

LICENSE="0BSD Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD Boost-1.0 CC0-1.0 ISC MIT MPL-2.0 Unicode-DFS-2016 Unlicense ZLIB"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${MY_PN}-${PV}"

DEPEND="
	dev-db/pgvector
	${POSTGRES_DEP}
"
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir "${S}" || die "Failed creating source directory"

	vchord_unpack() {
		unpack "${P}"-pg"${PG_SLOT}".zip
	}

	postgres-multi_foreach vchord_unpack
}

src_compile() { true; }

src_install() {
	vchord_install() {
		insinto "$(${PG_CONFIG} --pkglibdir)"
		doins vchord.so
		fperms 0755 "$(${PG_CONFIG} --pkglibdir)"/vchord.so

		insinto "$(${PG_CONFIG} --sharedir)"/extension
		doins vchord*.sql vchord.control
	}

	postgres-multi_foreach vchord_install
}

pkg_postinst() {
	if [[ -z "${REPLACING_VERSIONS}" ]]; then
		echo
		elog Install the vectorchord extension with the following PSQL commands:
		elog
		elog ALTER SYSTEM SET shared_preload_libraries = \"vchord.so\"
		elog
		elog Then restart your PostgreSQL cluster and enable the extension:
		elog
		elog CREATE EXTENSION IF NOT EXISTS vchord CASCADE
	fi
}
