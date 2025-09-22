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

	home.pontierCursor = {
		gtk.enable = true;
		x11.enable = true;
		
		package = pkgs.biabata-cursor;
		name = "Biabata-Modern-Ice";
		size = 22;
	};

	home.stateVersion = "25.05";
}
