{ config, pkgs, lib, ... }:
{
	home.username = "gilli";
	home.homeDirectory = "/home/gilli";
	
	imports = [
		./modules/desktop.nix	
	];
	home.stateVersion = "25.05";
}
