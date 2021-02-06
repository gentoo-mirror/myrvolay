# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{7..9} )
inherit distutils-r1 git-r3

DESCRIPTION="A Unity asset extractor for Python based on AssetStudio"
HOMEPAGE="https://github.com/K0lb3/UnityPy"
EGIT_REPO_URI="https://github.com/K0lb3/UnityPy.git"

LICENSE="MIT"
SLOT="0"

DEPEND="
	app-arch/brotli[python]
	dev-python/lz4
	dev-python/pillow
	dev-python/texture2ddecoder
"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-python/texture2ddecoder
"
