# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1 git-r3

DESCRIPTION="A Unity asset extractor for Python based on AssetStudio"
HOMEPAGE="https://github.com/K0lb3/UnityPy"
EGIT_REPO_URI="https://github.com/K0lb3/UnityPy.git"
EGIT_COMMIT="fb2f5f516da5e4fad3924b1087137efa40103b1f"

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
