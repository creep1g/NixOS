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

  # networking.hosts = {
  #   "130.208.165.190" = [ "site1.irei.hi.is" "site2.irei.hi.is" ];
  # };

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
    extraGroups = [ "networkmanager" "wheel" "input" "docker" ];
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

  # ── Containers / networking services ─────────────────────────────────
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };

  services.tailscale.enable = true;

  # Memory-pressure tuning (zram, sysctls, earlyoom) lives in
  # modules/core/memory.nix.

  services.iperf3 = {
    enable = true;
    openFirewall = true; # opens port 5201
  };

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
    satty
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
    copilot-language-server

    # Graphics / documents
    gimp3-with-plugins
    rawtherapee
    imagemagick
    inkscape
    geeqie
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
    iperf3

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
    docker
    docker-compose

    # Security — recon
    subfinder    # subdomain enumeration
    httpx        # probe live hosts
    amass        # in-depth subdomain enum
    ffuf         # web fuzzer
    gobuster     # directory/subdomain brute force
    feroxbuster  # recursive content discovery
    nuclei       # vulnerability scanner with templates
    waybackurls  # pull URLs from the Wayback Machine

    # Security — network scanning
    nmap
    masscan
    netcat
    wireshark    # GUI packet analysis
    tshark       # wireshark CLI

    # Security — web testing / exploitation
    burpsuite
    sqlmap
    nikto
    curl
    python3Packages.requests
    python3Packages.beautifulsoup4
    python3Packages.pyyaml

    # Security — password / hash tools
    hashcat
    john
    hydra

    # Security — utilities
    jq
    proxychains
    tor
    openssl
    whois
    dnsutils     # dig, nslookup
    binutils

    # System / misc
    htop
    killall
    neofetch
    cmatrix
    sl
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
