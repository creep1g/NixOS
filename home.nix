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
    # Video hardware-decode vars (QTWEBENGINE_CHROMIUM_FLAGS, LIBVA_DRIVER_NAME)
    # live in Hyprland's env block instead - a display-manager session does not
    # source home-manager's session-variable script.
  };

  home.stateVersion = "25.05";
}
