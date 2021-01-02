# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=7

inherit cmake

DESCRIPTION="An ncurses mixer for PulseAudio inspired by pavucontrol"
HOMEPAGE="https://github.com/fulhax/ncpamixer"
SRC_URI="https://github.com/fulhax/ncpamixer/archive/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+wide"

DEPEND="
    media-sound/pulseaudio
    dev-util/cmake
"
RDEPEND="${DEPEND}"

CMAKE_USE_DIR="${S}/src"

src_configure() {
    local mycmakeargs=(
        -DUSE_WIDE="$(usex wide)"
    )

    cmake_src_configure
}
