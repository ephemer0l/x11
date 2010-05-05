# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit linux-info xorg-2

EGIT_REPO_URI="git://anongit.freedesktop.org/git/nouveau/${PN}"

DESCRIPTION="Accelerated Open Source driver for nVidia cards"
HOMEPAGE="http://nouveau.freedesktop.org/"
SRC_URI=""

KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=x11-base/xorg-server-1.7[-minimal]
	>=x11-libs/libdrm-2.4.19[video_cards_nouveau]"

DEPEND="${RDEPEND}
	x11-proto/fontsproto
	x11-proto/randrproto
	x11-proto/renderproto
	x11-proto/videoproto
	x11-proto/xextproto
	x11-proto/xf86driproto
	x11-proto/xproto"

pkg_postinst() {
	xorg-2_pkg_postinst
	if ! has_version x11-base/nouveau-drm; then
		if ! linux_config_exists || ! linux_chkconfig_present DRM_NOUVEAU; then
			ewarn "Nouveau DRM not detected. If you want any kind of"
			ewarn "acceleration with nouveau, emerge x11-base/nouveau-drm or"
			ewarn "enable CONFIG_DRM_NOUVEAU in the kernel."
		fi
		if kernel_is 2 6 33 && has_version ">=x11-libs/libdrm-2.4.18"; then
			ewarn "Nouveau DRM in kernel 2.6.33 is API incompatible to"
			ewarn ">=x11-libs/libdrm-2.4.18, please use x11-base/nouveau-drm"
			ewarn "or x11-libs/libdrm-2.4.18_pre20100211 instead."
		fi
		if kernel_is 2 6 33 && ! has_version x11-drivers/nouveau-firmware; then
			ewarn "Nouveau firmware not detected, for acceleration on NV50 (G80)"
			ewarn "and newer chipsets, emerge x11-drivers/nouveau-firmware."
		fi
	fi
}
