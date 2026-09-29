{ config, pkgs, ... }:
{
  imports = [
    ./modules/desktop.nix
  ];

  home.username = "gilli";
  home.homeDirectory = "/home/gilli";

  # Cursor theme for GTK, XWayland and (via the variables below) Hyprland.
  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic"; # case-sensitive
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionVariables = {
    HYPRCURSOR_THEME = config.home.pointerCursor.name;
    HYPRCURSOR_SIZE = toString config.home.pointerCursor.size;

    # Hardware-accelerate video in QtWebEngine (qutebrowser) so playback uses
    # the Intel media engine instead of software-decoding on the CPU (which was
    # pegging a core and adding to the memory-pressure lag). Pairs with
    # LIBVA_DRIVER_NAME=iHD set in modules/core/intel.nix.
    QTWEBENGINE_CHROMIUM_FLAGS =
      "--enable-features=VaapiVideoDecoder,VaapiVideoDecodeLinuxGL,CanvasOopRasterization"
      + " --ignore-gpu-blocklist --enable-gpu-rasterization --enable-zero-copy";
  };

  home.stateVersion = "25.05";
}
