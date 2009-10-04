# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-input-joystick/xf86-input-joystick-1.4.1.ebuild,v 1.2 2009/09/30 20:24:18 ssuominen Exp $

# Must be before x-modular eclass is inherited
#SNAPSHOT="yes"

inherit x-modular

DESCRIPTION="X.Org driver for joystick input devices"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~x86-fbsd"
RDEPEND=">=x11-base/xorg-server-1.7.0"
DEPEND="${RDEPEND}
	>=x11-proto/inputproto-2.0
	x11-proto/randrproto
	x11-proto/xproto"
