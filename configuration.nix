{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # ── Nix ──────────────────────────────────────────────────────────────
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  # ── Locale / time / keymap ───────────────────────────────────────────
  time.timeZone = "Atlantic/Reykjavik";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "is_IS.UTF-8";
    LC_IDENTIFICATION = "is_IS.UTF-8";
    LC_MEASUREMENT = "is_IS.UTF-8";
    LC_MONETARY = "is_IS.UTF-8";
    LC_NAME = "is_IS.UTF-8";
    LC_NUMERIC = "is_IS.UTF-8";
    LC_PAPER = "is_IS.UTF-8";
    LC_TELEPHONE = "is_IS.UTF-8";
    LC_TIME = "is_IS.UTF-8";
  };

  # The "custom" layout is defined in modules/keyboard.nix
  services.xserver.xkb = {
    layout = "custom";
    variant = "dvorak";
  };
  console.keyMap = "dvorak";

  # ── User ─────────────────────────────────────────────────────────────
  users.users.gilli = {
    isNormalUser = true;
    description = "gilli";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;

  # ── Desktop ──────────────────────────────────────────────────────────
  services.xserver.enable = true;
  programs.hyprland.enable = true;
  programs.xwayland.enable = true;
  xdg.portal.enable = true;
  services.libinput.enable = true;
  services.spice-vdagentd.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # ── Audio (PipeWire, with PulseAudio/JACK compatibility) ─────────────
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # ── Storage / automount ──────────────────────────────────────────────
  services.udisks2.enable = true;
  services.gvfs.enable = true; # needed for Thunar automount
  services.devmon.enable = true;
  services.udev.packages = with pkgs; [ calibre ];

  # ── Packages ─────────────────────────────────────────────────────────
  # hyprland, xwayland and fish are installed by their programs.* modules above.
  environment.systemPackages = with pkgs; [
    # Hyprland / Wayland desktop
    hyprcursor
    hyprpaper
    swww
    waybar
    sway
    wayland
    wlroots
    xdg-desktop-portal
    xdg-desktop-portal-wlr
    swaylock-effects
    swaylock-fancy
    mako
    libnotify
    rofi
    rofi-emoji
    grim
    slurp
    wl-clipboard
    wtype
    xorg.xhost
    glib
    gsettings-desktop-schemas
    gtk3
    gtk4
    bibata-cursors
    material-cursors

    # Input / automation
    libinput
    libinput-gestures
    wmctrl
    xdotool
    ydotool
    inotify-tools
    brightnessctl

    # Audio / media
    pulseaudio # for pactl etc.
    pavucontrol
    pamixer
    playerctl
    mpv
    vlc
    spotify
    spicetify-cli
    obs-studio

    # Files
    xfce.thunar
    xfce.thunar-volman
    ranger
    zip
    unzip
    sshfs
    usbutils

    # Terminal / editors
    kitty
    bash
    vim
    neovim
    emacs
    gedit
    vscode

    # Graphics / documents
    gimp3-with-plugins
    rawtherapee
    imagemagick
    viewnior
    zathura
    calibre
    kcc

    # Internet / chat
    firefox
    brave
    qutebrowser
    discord
    betterdiscordctl
    qbittorrent

    # Networking / VPN
    openconnect
    gpclient
    sshuttle
    wget

    # Development
    git
    gnumake
    gcc
    pkg-config
    nodejs
    bun
    jdk
    python3
    python313Packages.pip
    postman
    mailhog
    burpsuite

    # System / misc
    htop
    killall
    neofetch
    cmatrix
    blueberry
    bluez
    bluez-tools
    xdg-user-dirs
    gnome-keyring
  ];

  environment.variables = {
    IM6_COMPAT = "1";
    MAGICK_HOME = "/run/current-system/sw";
  };

  # This value determines the NixOS release from which the default settings
  # for stateful data were taken. Leave it at the release of the first install.
  system.stateVersion = "25.05";
}
