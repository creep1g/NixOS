{ config, pkgs, lib, environment, ... }:
{
	home.username = "gilli";
	home.homeDirectory = "/home/gilli";
	
	imports = [
		./modules/desktop.nix	
	];
	
	xdg.portals.config = {
		preferred = [ "hyprland" "gtk"];
	};

	home.pointerCursor = {
		gtk.enable = true;
		x11.enable = true;
		
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Ice";
		size = 22;
	};

	home.stateVersion = "25.05";
}
