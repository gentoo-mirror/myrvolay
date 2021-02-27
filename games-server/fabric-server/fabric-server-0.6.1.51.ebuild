# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# Sincere thanks to the AUR's fabric-server package, and thus also to the packages
# it is derived from (https://aur.archlinux.org/packages/fabric-server) in return

# Confirmed to work perfectly on my setup with net-analyzer/netcat, sudo, and IcedTea
# Very little if none testing has been done for the alternatives, the principes should
# remain the same and it *should* work, but I will be glad to fix potential issues

# Currently, can only install the latest version of the Minecraft server, and I have no
# idea how I could change this. This use case should fit most, but still, I like perfection

inherit java-pkg-2 systemd

DESCRIPTION="Minecraft server with the Fabric mod loader"
HOMEPAGE="https://fabricmc.net/"
SRC_URI="https://maven.fabricmc.net/net/fabricmc/fabric-installer/${PV}/fabric-installer-${PV}.jar"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+idle eula +usercmd"

ACCT_DEPEND="
	acct-group/fabric
	acct-user/fabric
"
BDEPEND="
	${ACCT_DEPEND}
	|| (
		>=virtual/jre-1.8:1.8
		>=virtual/jdk-1.8:1.8
	)
"
DEPEND="
	app-misc/screen
	|| (
		>=virtual/jre-1.8:1.8
		>=virtual/jdk-1.8:1.8
	)
	idle? ( ||
		(
			net-analyzer/netcat
			net-analyzer/openbsd-netcat
			net-analyzer/nmap[ncat]
		)
	)
	usercmd? ( ||
		(
			app-admin/sudo
			app-admin/doas
		)
	)

	app-arch/tar
	app-shells/bash:*
	sys-apps/sed
	virtual/awk
"
RDEPEND="
	${ACCT_DEPEND}
	${DEPEND}
"

# Network access is required to download the Minecraft server
RESTRICT="bindist network-sandbox"

S="${WORKDIR}"

# Fabric user home directory
FABRICDIR="/var/lib/fabric"

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}" || die
}

src_prepare() {
	# Always download latest version for now
	java -Duser.home="${S}" -jar fabric-installer-${PV}.jar server -downloadMinecraft
	eapply_user
}

src_install() {
	systemd_dounit "${FILESDIR}"/fabricd.service
	newconfd "${FILESDIR}"/fabricd.conf fabric
	newbin "${FILESDIR}"/fabricd.sh	fabricd

	# Install backup service
	systemd_dounit "${FILESDIR}"/fabricd-backup.service
	systemd_dounit "${FILESDIR}"/fabricd-backup.timer

	# Install Fabric proper
	java-pkg_jarinto "${FABRICDIR}"
	java-pkg_dojar fabric-server-launch.jar
	java-pkg_dojar server.jar
	fowners fabric:fabric "${FABRICDIR}"/{fabric-server-launch,server}.jar

	if use eula; then
		insinto "${FABRICDIR}"
		doins "${FILESDIR}"/eula.txt
		fowners fabric:fabric "${FABRICDIR}"/eula.txt
	fi
}

pkg_postinst() {
	elog "World data is stored under /var/lib/fabric and the server runs as the fabric user."
	elog "Use the fabricd script under /usr/bin/fabricd to start, stop, or backup the server."
	elog "Adjust the configuration file /etc/conf.d/fabric to your liking."

	if ! use eula; then
		ewarn "For the server to start, you have to accept the Minecraft EULA in ${FABRICDIR}/eula.txt"
		ewarn "The EULA file is generated after the first server start."
	fi
}

pkg_postrm() {
	[ -d "/var/lib/fabric" ] &&
	elog "Saved game data in ${FABRICDIR} has been kept on your system."
}
