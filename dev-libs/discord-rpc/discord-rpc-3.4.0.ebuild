# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

DESCRIPTION="Library for interfacing games with a locally running Discord desktop client."
HOMEPAGE="https://github.com/discord/discord-rpc"
SRC_URI="https://github.com/discord/discord-rpc/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="dev-libs/rapidjson"
RDEPEND="${DEPEND}"
