# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, fetchTarball, ... }: {
    imports =
        [ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        ];
# My services :)
    services.spice-vdagentd.enable = true;
    services.xserver.enable = true;
    programs.xwayland.enable = true;

    hardware.bluetooth.enable = true;
    services.blueman.enable = true;

    services.libinput.enable = true;
# My programs
    programs.hyprland = {
        enable = true;
    };

    xdg.portal.enable = true;

# Use latest kernel.
    boot.kernelPackages = pkgs.linuxPackages_zen;

# Set your time zone.
    time.timeZone = "Atlantic/Reykjavik";
    #networking.hosts = {
	#"130.208.165.190" = [ "site1.irei.hi.is" "site2.irei.hi.is" ];
     #};

# Select internationalisation properties.
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

virtualisation.docker = {
  enable = true;
  enableOnBoot = true;  # starts automatically
};
# Configure keymap in X11
    services.xserver.xkb = {
        layout = "custom";
        variant = "dvorak";
    };

# Configure console keymap
    console.keyMap = "dvorak";

# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.gilli = {
        isNormalUser = true;
        description = "gilli";
        extraGroups = [ "networkmanager" "wheel" "input" "docker"];
        packages = with pkgs; [];
    };

    programs.nix-ld.enable = true;
#programs.nix-ld.enable = with pkgs; [];
# Experimental features
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    nixpkgs.config.allowUnfree = true;


# Allow unfree packages

# spice service
# SHel
    programs.fish.enable = true;
    users.users.gilli = {
        shell = pkgs.fish;
    };

## Audio
##
   services.pipewire = {
     enable = true;
     alsa.enable = true;
     pulse.enable = true;  # This gives you pactl
     jack.enable = true;
   };

   # services.wireplumber.enable = true;

   services.udisks2.enable = true;

   services.gvfs.enable = true; # needed for Thunar automount

   services.devmon.enable = true; # optional but helpful
   services.udev.packages = with pkgs; [
      calibre
   ];

services.tailscale.enable = true;

  # Disable legacy PulseAudio service (PipeWire provides compatibility)
   # hardware.pulseaudio.enable = false;
# List packages installed in system profile. To search, run:
# $ nix search wget
    environment.systemPackages = with pkgs; [
#  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
# Core desktop / Hyprland
            hyprland
            pulseaudio
            xfce.thunar
	    grim
            slurp
            satty
	    calibre
	    qbittorrent
	    gnumake
	    gcc
            pkg-config
	    xfce.thunar-volman
            hyprcursor
	    kcc
	    inkscape
            geeqie
            spicetify-cli
            spotify
            brave
            bibata-cursors
            hyprpaper
	    copilot-language-server
            sshuttle
            wayland
            mailhog
            usbutils
            rawtherapee
            swww
            sshfs
            firefox
            swaylock-fancy
            xorg.xhost
            swaylock-effects
            waybar
            sway
            xwayland
            postman
            material-cursors
            zip
            htop
            wlroots
            bash
            unzip
            cmatrix
            openconnect
            gpclient
            xdg-desktop-portal-wlr
            libinput-gestures
            libinput
            wmctrl # Useful for some commands, but you can also use hyprctl
            xdotool  # Used to simulate keystrokes
            ydotool
            inotify-tools
            glib
            gsettings-desktop-schemas
            xdg-desktop-portal
            fish
            kitty
            neovim # Need to get nightly
            emacs
            gcc
            gedit
            rofi
            ranger
            libnotify
            playerctl # do i need this?
            gtk3
            gtk4
            gimp3-with-plugins
            mako
            pavucontrol
            pamixer
            brightnessctl
            grim
            slurp
            wl-clipboard
            mako
            viewnior
            zathura
            imagemagick
            wtype
            rofi-emoji
            mpv
            ranger
# Dev tools
            nodejs
            bun
            jdk
            killall
            python3

            python313Packages.pip
            burpsuite
  # === RECON ===
  subfinder          # subdomain enumeration
  httpx              # probe live hosts
  amass              # in-depth subdomain enum
  ffuf               # web fuzzer
  gobuster           # directory/subdomain brute force
  feroxbuster        # recursive content discovery
  nuclei             # vulnerability scanner with templates
  waybackurls        # pull URLs from Wayback Machine

  # === NETWORK SCANNING ===
  nmap               # port scanning
  masscan            # fast port scanning
  netcat             # network swiss army knife
  wireshark          # packet analysis (GUI)
  tshark             # wireshark CLI

  # === WEB TESTING / EXPLOITATION ===
  sqlmap             # SQL injection automation
  nikto              # web server scanner
  curl               # HTTP requests
  wget               # file retrieval
  python3            # scripting
  python3Packages.requests
  python3Packages.beautifulsoup4
  python3Packages.yaml

  # === PASSWORD / HASH TOOLS ===
  hashcat            # GPU hash cracking
  john               # John the Ripper
  	    hydra              # online brute force

  # === UTILITIES ===
  	    jq                 # JSON parsing (great for API responses)
 	    proxychains        # route tools through Burp
            tor
            openssl
            whois
            dnsutils           # dig, nslookup
	    binutils

# Desktop extras
            blueberry
            bluez
            bluez-tools
            xdg-user-dirs
            gnome-keyring
            neofetch
            obs-studio
            vlc
	    sl
            discord
            betterdiscordctl
            vscode
            wget
	    iperf3
            git
	    docker
            docker-compose
            qutebrowser
            vim
            ];

    environment.variables = {
        IM6_COMPAT = "1";
        MAGICK_HOME = "/run/current-system/sw";
    };

    services.iperf3 = {
  enable = true;
  openFirewall = true; # Opens port 5201 automatically
};

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "25.05"; # Did you read the comment?

                                          }
