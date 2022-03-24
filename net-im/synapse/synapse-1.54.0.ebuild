# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{6..10} )
inherit distutils-r1 systemd

MY_PV="${PV/_rc/rc}"

DESCRIPTION="Synapse: Matrix reference homeserver"
HOMEPAGE="http://matrix.org"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/matrix-org/${PN}.git"
else
	SRC_URI="https://github.com/matrix-org/synapse/archive/v${MY_PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"

IUSE="hiredis ldap oidc postgres redis saml sentry systemd +url-preview"
REQUIRED_USE="hiredis? ( redis )"

RDEPEND="
	>=dev-python/jsonschema-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/frozendict-1[${PYTHON_USEDEP}]
	<dev-python/frozendict-2.1.2[${PYTHON_USEDEP}]
	>=dev-python/unpaddedbase64-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/canonicaljson-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/signedjson-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/pynacl-1.2.1[${PYTHON_USEDEP}]
	>=dev-python/idna-2.5[${PYTHON_USEDEP}]
	>=dev-python/service_identity-18.1.0[${PYTHON_USEDEP}]

	>=dev-python/twisted-18.9.0[${PYTHON_USEDEP}]

	>=dev-python/treq-15.1[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-16.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.1.9[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-modules-0.0.7[${PYTHON_USEDEP}]
	>=dev-python/bcrypt-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-4.3.0[jpeg,${PYTHON_USEDEP}]
	>=dev-python/sortedcontainers-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/pymacaroons-0.13.0[${PYTHON_USEDEP}]
	>=dev-python/msgpack-0.5.2[${PYTHON_USEDEP}]
	>=dev-python/phonenumbers-8.2.0[${PYTHON_USEDEP}]
	>=dev-python/prometheus_client-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-17.4.0[${PYTHON_USEDEP}]
	>=dev-python/netaddr-0.7.18[${PYTHON_USEDEP}]
	>=dev-python/jinja-2.9[${PYTHON_USEDEP}]
	>=dev-python/bleach-1.4.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-3.7.4[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.4.7[${PYTHON_USEDEP}]
	>=dev-python/ijson-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/matrix-python-common-1.1.0:0=[${PYTHON_USEDEP}]

	>=dev-python/daemonize-2.3.1[${PYTHON_USEDEP}]
	>=dev-python/psutil-2.0.0[${PYTHON_USEDEP}]

	dev-python/importlib_metadata[${PYTHON_USEDEP}]

	hiredis? ( dev-python/hiredis[${PYTHON_USEDEP}] )
	ldap? ( >=dev-python/matrix-synapse-ldap3-0.1[${PYTHON_USEDEP}] )
	oidc? ( >=dev-python/Authlib-0.14.0[${PYTHON_USEDEP}] )
	postgres? ( >=dev-python/psycopg-2.8[${PYTHON_USEDEP}] )
	!postgres? ( dev-lang/python[sqlite] )
	redis? ( dev-db/redis
			>=dev-python/txredisapi-1.4.7[${PYTHON_USEDEP}]
			dev-python/redis-py[${PYTHON_USEDEP}]
	)
	saml? ( >=dev-python/pysaml2-4.5.0[${PYTHON_USEDEP}] )
	sentry? ( >=dev-python/sentry-sdk-0.7.2[${PYTHON_USEDEP}] )
	systemd? ( dev-python/python-systemd[${PYTHON_USEDEP}] )
	url-preview? ( >=dev-python/lxml-3.5.0[${PYTHON_USEDEP}] )

	acct-user/synapse
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}"

python_install_all() {
	distutils-r1_python_install_all

	keepdir /var/lib/synapse

	newconfd "${FILESDIR}"/synapse.confd synapse
	newinitd "${FILESDIR}"/synapse.initd synapse
	systemd_newunit "${FILESDIR}"/synapse.service synapse.service
}
