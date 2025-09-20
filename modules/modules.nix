# Imports all modules witihn nixos/modules
{ ... }:
{
	imports = [
	./keyboard.nix
	#./nvim/config.nix
	./desktop/sddm.nix
	./fonts.nix
	];
}
