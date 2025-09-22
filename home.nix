{ config, pkgs, lib, environment, ... }:
{
	home.username = "gilli";
	home.homeDirectory = "/home/gilli";
	

	  # 1. Enable the cursor configuration
  home.pointerCursor = {
    # The Nix package that provides the cursor theme
    package = pkgs.bibata-cursors;

    # The actual theme name inside the package (e.g., the folder name)
    # The name is case-sensitive!
    name = "Bibata-Modern-Classic";

    # The size of the cursor (e.g., 16, 24, 32)
    size = 24;

    # This ensures the setting is applied to GTK applications
    gtk.enable = true;

    # This ensures the setting is applied to XWayland applications
    x11.enable = true;
  };

  # 2. Add Hyprland-specific Environment Variables
  # Hyprland uses the HYPRCURSOR_THEME variable, and Home Manager should set it
  # automatically based on the above, but explicitly setting it can help.
  home.sessionVariables = {
    # Match the name and size from above
    HYPRCURSOR_THEME = config.home.pointerCursor.name;
    HYPRCURSOR_SIZE = builtins.toString config.home.pointerCursor.size;
  };

  # Optional but recommended: For full consistency across all apps (Hyprland, GTK, XWayland):
  # Ensure your Hyprland configuration is also using these variables.
  # If you are using the Home Manager Hyprland module:
  # wayland.windowManager.hyprland.settings = {
  #   env = [
  #     "HYPRCURSOR_THEME,${config.home.pointerCursor.name}"
  #     "HYPRCURSOR_SIZE,${builtins.toString config.home.pointerCursor.size}"
  #   ];
  #   # You may also explicitly set the cursor in the Hyprland config for good measure
  #   # exec-once = hyprctl setcursor ${config.home.pointerCursor.name} ${builtins.toString config.home.pointerCursor.size};
# };
	imports = [
		./modules/desktop.nix	
	];
	

	home.stateVersion = "25.05";
}
