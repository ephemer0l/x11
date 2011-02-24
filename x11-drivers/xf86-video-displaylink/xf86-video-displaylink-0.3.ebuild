# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit xorg-2

DESCRIPTION="xf86 displaylink driver"
HOMEPAGE="http://libdlo.freedesktop.org/wiki/xf86-driver-displaylink"
SRC_URI="http://projects.unbit.it/downloads/udlfb-0.2.3_and_${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

S="${WORKDIR}/${PN}"

PATCHES=( "${FILESDIR}/${P}-xorg-abi-fix.patch" )
