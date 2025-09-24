# Imports all modules witihn nixos/modules
{ ... }:
{
	imports = [
	    ./desktop/hyprland/config.nix
	    ];
}
