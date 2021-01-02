# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=7

DESCRIPTION="AFNOR NF Z721-300 AZERTY keymap for the Linux console"
HOMEPAGE="https://github.com/myrvogna/fr-afnor.git"
SRC_URI="https://github.com/myrvogna/fr-afnor/archive/${PV}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="sys-apps/kbd"
RDEPEND="${DEPEND}"

src_install() {
    insinto /usr/share/keymaps/i386/azerty/
    doins -r fr-afnor.map.gz
}
