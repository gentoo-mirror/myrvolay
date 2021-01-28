# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1

DESCRIPTION="A Unity asset extractor for Python based on AssetStudio"
HOMEPAGE="https://github.com/K0lb3/UnityPy"

# Upstream capitalisation for package name
MY_PN="UnityPy"
MY_P="${MY_PN}-${MY_PV}"

# Use commit of specific version
GIT_COMMIT="fb2f5f516da5e4fad3924b1087137efa40103b1f"
SRC_URI="https://github.com/K0lb3/UnityPy/archive/${GIT_COMMIT}.tar.gz -> ${MY_P}.tar.gz"
S="${WORKDIR}/${MY_PN}-${GIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
	app-arch/brotli
	dev-python/lz4
	dev-python/pillow
	dev-python/texture2ddecoder
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/texture2ddecoder
"
