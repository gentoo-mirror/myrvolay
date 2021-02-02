# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit systemd

DESCRIPTION="Utility to control BIOS fan control on some Dell laptops"
HOMEPAGE="https://github.com/TomFreudenberg/dell-bios-fan-control"

# Use commit of specific version
GIT_COMMIT="a2c81a2918b15b97bdb1c6bf41233e4c2786d416"
SRC_URI="https://github.com/TomFreudenberg/dell-bios-fan-control/archive/${GIT_COMMIT}.zip -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${GIT_COMMIT}"

src_install() {
	dobin dell-bios-fan-control
	dodoc README.md
	systemd_dounit "${FILESDIR}/dell-bios-fan-control.service"
}
