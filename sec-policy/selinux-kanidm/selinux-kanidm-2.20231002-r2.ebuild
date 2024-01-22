# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

MODS="kanidm"
BASEPOL="2.20231002-r2"
POLICY_FILES="kanidm.te kanidm.fc kanidm.if"

inherit selinux-policy-2

DESCRIPTION="SELinux policy for kanidm"

if [[ ${PV} != 9999* ]] ; then
	KEYWORDS="~amd64 ~arm ~arm64 ~mips ~x86"
fi
