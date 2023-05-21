# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for net-nds/kanidm-server"
ACCT_USER_ID=173
ACCT_USER_GROUPS=( nobody )

acct-user_add_deps
