# Imports all modules witihn nixos/modules
{ ... }:
{
	imports = [
	./keyboard.nix
	./desktop/hyprland.nix
	];
}
