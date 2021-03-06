# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit linux-info systemd

DESCRIPTION="Multicast Routing Daemon using only IGMP signalling"
HOMEPAGE="https://github.com/pali/igmpproxy"
SRC_URI="https://github.com/pali/igmpproxy/releases/download/${PV}/${P}.tar.gz"

LICENSE="GPL-2 Stanford"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

CONFIG_CHECK="~IP_MULTICAST ~IP_MROUTE"

src_install() {
	emake DESTDIR="${D}" install
	newinitd "${FILESDIR}/${PN}-init.d" ${PN}
	newconfd "${FILESDIR}/${PN}-conf.d" ${PN}
	systemd_dounit "${FILESDIR}/${PN}.service"
}
