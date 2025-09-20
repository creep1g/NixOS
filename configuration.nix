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
  #services.displayManager.sddm.enable = true;
#	services.displayManager.sddm.theme = "sddm-sugar-dark";
	hardware.bluetooth.enable = true;
	services.blueman.enable = true;

  # My programs
  programs.hyprland = {
	enable = true;
};

# Bootloader.
#  boot.loader.grub.enable = true;
#  boot.loader.grub.device = "/dev/sda";
#  boot.loader.grub.useOSProber = true;

# Use latest kernel.
 boot.kernelPackages = pkgs.linuxPackages_zen;

  networking.hostName = "nixos"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
	  networking.networkmanager.enable = true;

# Set your time zone.
  time.timeZone = "Atlantic/Reykjavik";

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

#  nixpkgs.overlays = [
#	(import ./overlay-xkb.nix)
#	];
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
	  extraGroups = [ "networkmanager" "wheel" ];
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


# List packages installed in system profile. To search, run:
# $ nix search wget
  environment.systemPackages = with pkgs; [
#  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
	    # Core desktop / Hyprland
			hyprland
			hyprcursor
			hyprpaper
			wayland
			swww
			swaylock
			swaylock-fancy
			waybar
			htop
			wlroots
			bash
			xdg-desktop-portal-wlr
			inotify-tools
			xdg-desktop-portal
			fish
			kitty
			neovim # Need to get nightly
			emacs
			gcc
			gedit
			rofi
			pywal
			ranger
			playerctl # do i need this?
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
			python3
			python313Packages.pip

			# Desktop extras
			blueberry
			bluez
			bluez-tools
			xdg-user-dirs
			gnome-keyring
			neofetch
			obs-studio
			vlc
			discord
			vscode
			wget
		  git
		  qutebrowser
		  vim
  ];

  environment.variables = {
    IM6_COMPAT = "1";
    MAGICK_HOME = "/run/current-system/sw";
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
