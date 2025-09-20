# Imports all modules witihn nixos/modules
{ ... }:
{
	imports = [
	./keyboard.nix
	#./nvim/config.nix
	./fonts.nix
	];
}
