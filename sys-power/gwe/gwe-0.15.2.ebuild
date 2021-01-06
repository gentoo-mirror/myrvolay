# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit meson

DESCRIPTION="NVIDIA settings alternative with overclocking, fan control, and information"
HOMEPAGE="https://gitlab.com/leinardi/gwe"
SRC_URI="https://gitlab.com/leinardi/gwe/-/archive/${PV}/gwe-${PV}.tar.gz"

SLOT="0"
LICENSE="GPL-3"
KEYWORDS="~amd64"

BDEPEND="
		dev-libs/appstream-glib
		virtual/pkgconfig
"
RDEPEND="
		dev-libs/gobject-introspection
		dev-libs/libappindicator
		dev-libs/libdazzle
		dev-python/injector
		dev-python/matplotlib
		dev-python/peewee
		dev-python/py3nvml
		dev-python/pygobject
		dev-python/python-xlib
		dev-python/pyxdg
		dev-python/requests
		dev-python/Rx
"
