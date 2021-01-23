# myrvolay
myrvogna's personal Gentoo overlay. Do not try to make sense of the name – it does not work, indeed.

Primarily made for my own convenience and a bit of inexperience might reveal itself there and there, that notwithstanding I believe every single package in here to be at least decent enough for use by whoever is so inclined.

My overlay is registered on the list of repositories at https://repos.gentoo.org/, so you can enable it with `eselect repository enable myrvolay`.

Please feel free to contact me if there is an issue with any of those, or if you have an improvement to suggest – I will be glad~

### Todo list ###
- Review older ebuilds and improve quality (most likely remove redundancies) if needed
- Try to test everything on arm64 and add to keywords if results are successful

### Overlay content ###
* app-crypt
  * [libsecret](https://packages.gentoo.org/packages/app-crypt/libsecret): allow for the use of KeePassXC as Secret Service API provider instead of gnome-keyring, will stay here until it gets implemented in the official repository
* dev-libs
  * [discord-rpc](https://github.com/discord/discord-rpc): Discord Rich Presence library, for use with other ebuilds
* dev-python
  * [injector](https://pypi.org/project/injector/)
  * [py3nvml](https://pypi.org/project/py3nvml/)
  * [yams](https://github.com/Berulacks/yams): Last.FM scrobbler for MPD
* games-emulation
  * [duckstation](https://github.com/stenzek/duckstation): PlayStation 1 emulator
* games-util
  * [sidewinderd](https://github.com/tolga9009/sidewinderd): Linux support for Microsoft SideWinder X4 / X6 and Logitech G103 / G105 / G710+
* gui-apps
  * [wev](https://git.sr.ht/~sircmpwn/wev): Wayland event viewer, analoguous to xev for X11
* media-fonts
  * [material-design-icons](https://github.com/google/material-design-icons/): Google's Material Design icons
  * [renogare](https://www.creativefabrica.com/product/renogare/): A modern geometric sans serif typeface (notably used in Celeste)
* media-sound
  * [ncpamixer](https://github.com/fulhax/ncpamixer): ncurses PulseAudio mixer, analoguous to pavucontrol
* net-im
  * [discord-canary-bin](https://discord.com/): Installer for the alpha testing version of Discord
* sys-apps
  * [fr-afnor](https://github.com/myrvogna/fr-afnor): My implementation of the new French AZERTY layout (AFNOR NF Z71-300) for the Linux console keymap
* sys-firmware
  * [brcm43456-firmware](https://github.com/RPi-Distro/firmware-nonfree): Firmware for the BCM3456 WiFi/BT chip of the Raspberry Pi 400
* sys-power
  * [gwe](https://gitlab.com/leinardi/gwe): GreenWithEnvy, system utility for information, fan control and overclocking Nvidia GPUs
* x11-misc
  * [dragon](https://github.com/mwh/dragon): Drag-and-drop utility for X and Wayland
