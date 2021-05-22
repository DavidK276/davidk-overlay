# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

MY_PN="${PN}"

inherit pax-utils unpacker xdg

DESCRIPTION="A new blockchain and smart transaction platform that is easier to use, more efficient, and secure."
HOMEPAGE="https://chia.net/"
SRC_URI="https://download-chia-net.s3-us-west-2.amazonaws.com/install/chia-blockchain_${PV}_amd64.deb"
LICENSE="GPL-3 MIT MIT-with-advertising BSD-1 BSD-2 BSD Apache-2.0 ISC openssl ZLIB APSL-2 icu Artistic-2 LGPL-2.1"
SLOT="0"
KEYWORDS="-* ~amd64"
IUSE=""

RDEPEND="
	app-accessibility/at-spi2-atk
	app-accessibility/at-spi2-core
	dev-libs/atk
	dev-libs/expat
	dev-libs/glib
	dev-libs/nspr
	dev-libs/nss
	media-libs/alsa-lib
	media-libs/mesa[X(+)]
	net-print/cups
	sys-apps/dbus[X]
	x11-libs/cairo
	x11-libs/gdk-pixbuf
	x11-libs/gtk+:3[X]
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
"

RESTRICT="splitdebug"

S="${WORKDIR}"

src_prepare() {
	default
	sed -e 's| --no-sandbox||g' \
		-i usr/share/applications/chia-blockchain.desktop || die
}

src_install() {
	insinto /usr/bin
	doins usr/bin/chia-blockchain
	insinto /usr
	doins -r usr/lib
	fperms +x /usr/bin/chia-blockchain /usr/lib/chia-blockchain/chrome-sandbox
	fperms u+s /usr/lib/chia-blockchain/chrome-sandbox
	insinto /usr/share
	doins -r usr/share/applications
	doins -r usr/share/pixmaps
}

pkg_postinst() {
	xdg_pkg_postinst
}
