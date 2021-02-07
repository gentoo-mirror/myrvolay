# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Sway utility to automatically change keyboard layout on a per-window basis"
HOMEPAGE="https://github.com/artemsen/swaykbdd"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/artemsen/swaykbdd.git"
else
	SRC_URI="https://github.com/artemsen/swaykbdd/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

DEPEND="
	dev-libs/json-c
	gui-wm/sway
"
RDEPEND="${DEPEND}"
