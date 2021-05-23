# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN}"

inherit pax-utils unpacker xdg

DESCRIPTION="SoundWire Audio Communication System"
HOMEPAGE="http://georgielabs.net/"
SRC_URI="https://georgielabs.altervista.org/SoundWire_Server_linux64.tar.gz"
LICENSE="SoundWire"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

RDEPEND="
	dev-libs/glib
	dev-qt/qtcore
	dev-qt/qtwidgets
	media-libs/alsa-lib
	media-libs/mesa[X(+)]
	sys-apps/dbus[X]
	sys-libs/glibc
	x11-libs/cairo
	x11-libs/libX11
	x11-libs/libxcb
	x11-libs/libxkbcommon
	x11-libs/libXcomposite
	x11-libs/libXcursor
	x11-libs/libXdamage
	x11-libs/libXext
	x11-libs/libXfixes
	x11-libs/libXi
	x11-libs/libXrandr
	x11-libs/libXrender
	x11-libs/libXScrnSaver
	x11-libs/libXtst
	x11-libs/pango
	media-sound/pulseaudio
	media-sound/pavucontrol
	media-libs/portaudio
"

RESTRICT="splitdebug"

S="${WORKDIR}"

src_prepare() {
	default
}

src_install() {
	insinto /usr/bin
	doins SoundWireServer/SoundWireServer
	insinto /usr/share/applications
	doins SoundWireServer/SoundWire-Server.desktop
	insinto /usr/share/icons
	doins SoundWireServer/sw-icon.xpm
	fperms +x /usr/bin/SoundWireServer
}

pkg_postinst() {
	xdg_pkg_postinst
}
