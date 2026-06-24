# Hyprland Configuration

My Hyprland Configuration.

## Layout

- `ROOT_FS/` maps to the filesystem root `/`.
- `XDG_CONFIG_HOME/` maps to `${XDG_CONFIG_HOME:-$HOME/.config}`.
- `XDG_CONFIG_HOME/hypr/lua/` contains split Hyprland Lua configuration modules.

## Packages

These are the required packages to install.

### Basic Components

These are some essential basic non-graphical software.

**Graphics**
- mesa
- vulkan-icd-loader
- vulkan-tools

AMD:
- vulkan-radeon
- libva-mesa-driver
- mesa-vdpau

Intel:
- vulkan-intel
- intel-media-driver

**Network**
- networkmanager

**Bluetooth**
- bluez
- bluez-utils
- blueman

**Audio & Screen**
- pipewire
- pipewire-jack
- pipewire-alsa
- pipewire-pulse
- wireplumber

**Desktop Portal**
- xdg-desktop-portal
- xdg-desktop-portal-hyprland
- xdg-desktop-portal-gtk
- xdg-user-dirs

**Clipboard**
- wl-clipboard

**Fonts**
- noto-fonts
- noto-fonts-cjk
- noto-fonts-emoji
- noto-fonts-extra
- ttf-jetbrains-mono
- ttf-nerd-fonts-symbols
- ttf-nerd-fonts-symbols-mono

**Session & Login Manager**
- uwsm
- libnewt
- greetd
- greetd-regreet

### Desktop Components

These are some graphical tools on the desktop.

**Hyprland Components**
- hyprland
- hyprlauncher
- hyprpolkitagent
- hyprlock
- hypridle
- hyprpaper
- hyprpicker
- hyprpwcenter
- hyprshutdown
- hyprland-qt-support

**Waybar and its Dependent Components**
- waybar
- cliphist
- wofi
- playerctl
- brightnessctl
- libnotify
- pavucontrol
- network-manager-applet
- lm_sensors

**Notification Tool**
- mako

**Library**
- qt5-wayland
- qt6-wayland

**File Manager**
- thunar
- gvfs
- gvfs-smb
- gvfs-mtp
- tumbler
- ffmpegthumbnailer
- file-roller
- thunar-archive-plugin
- thunar-media-tags-plugin

**Terminal**
- alacritty

**Icon Theme**
- papirus-icon-theme
