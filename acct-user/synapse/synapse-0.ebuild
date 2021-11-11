# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for Synapse, the Matrix reference homeserver"

KEYWORDS="~amd64 ~x86"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( synapse )
ACCT_USER_HOME="/var/lib/synapse"
acct-user_add_deps
