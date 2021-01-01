# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1 systemd

DESCRIPTION="A Last.FM scrobbler for MPD (Yet Another Mpd Scrobbler)"
HOMEPAGE="https://github.com/Berulacks/yams"
SRC_URI="https://github.com/Berulacks/yams/archive/${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
    dev-python/psutil
    dev-python/pyyaml
    dev-python/python-mpd
    media-sound/mpd
"
RDEPEND="${DEPEND}"

python_prepare_all() {
	distutils-r1_python_prepare_all
	sed -e "/'yams-${PV}'/d" -i setup.py || die
}

python_install_all() {
    systemd_douserunit yams.service
    distutils-r1_python_install_all
}
