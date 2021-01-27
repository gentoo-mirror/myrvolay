# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6..9} )
inherit distutils-r1 git-r3

DESCRIPTION="A python wrapper for Perfare's Texture2DDecoder"
HOMEPAGE="https://github.com/K0lb3/texture2ddecoder"
EGIT_REPO_URI="https://github.com/K0lb3/texture2ddecoder.git"
EGIT_COMMIT="d05d5fd9bc38044bf4a7c762f4095ca07ca711c8"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

src_prepare() {
	default

	# Adding -fpermissive to the extra_compile_args array
	# Compilation may fail it is not enabled
	sed -i 's/"-std=c++11"/& , "-fpermissive"/' setup.py
}
