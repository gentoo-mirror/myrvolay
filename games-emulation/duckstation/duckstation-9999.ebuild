# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake desktop git-r3 xdg-utils

DESCRIPTION="Fast Sony PlayStation (PSX) emulator"
HOMEPAGE="https://github.com/stenzek/duckstation"
EGIT_REPO_URI="https://github.com/stenzek/duckstation.git"
EGIT_CHECKOUT_DIR="${WORKDIR}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# TODO: Potential X11 flag to allow for a pure Wayland build?
# Don't have the means to check myself, help would be welcome.
IUSE="discord egl +qt5 sdl +gamepad -wayland"

# Either or both frontends must be built - no CLI is available
REQUIRED_USE="
	|| ( qt5 sdl )
	wayland? ( egl )
"

DEPEND="
	sdl? ( media-libs/libsdl2 )
	gamepad? ( media-libs/libsdl2 )
	qt5? (
			dev-qt/qtcore
			dev-qt/qtgui
			dev-qt/qtnetwork
	)
	>=x11-libs/gtk+-3.24.20
"
RDEPEND="${DEPEND}"

# Set working directory to checkout directory
S="${WORKDIR}/${PN}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SDL_FRONTEND=$(usex sdl)
		-DBUILD_QT_FRONTEND=$(usex qt5)
		-DUSE_SDL2=$(usex gamepad)
		-DUSE_WAYLAND=$(usex wayland)
		-DUSE_EGL=$(usex egl)
		–DENABLE_DISCORD_PRESENCE=$(usex discord)

		# Override cmake.eclass defaults
		-DBUILD_SHARED_LIBS=OFF
	)

	cmake_src_configure
}

src_install() {
	dodoc README.md

	if use sdl; then
		newicon -s 16 appimage/icon-16px.png duckstation-sdl
		newicon -s 32 appimage/icon-32px.png duckstation-sdl
		newicon -s 48 appimage/icon-48px.png duckstation-sdl
		newicon -s 64 appimage/icon-64px.png duckstation-sdl
		domenu appimage/duckstation-sdl.desktop
		dobin "${BUILD_DIR}"/bin/duckstation-sdl
	fi

	if use qt5; then
		newicon -s 16 appimage/icon-16px.png duckstation-qt
		newicon -s 32 appimage/icon-32px.png duckstation-qt
		newicon -s 48 appimage/icon-48px.png duckstation-qt
		newicon -s 64 appimage/icon-64px.png duckstation-qt
		domenu appimage/duckstation-qt.desktop
		dobin "${BUILD_DIR}"/bin/duckstation-qt
	fi
}

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}
