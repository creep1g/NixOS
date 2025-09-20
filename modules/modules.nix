# Imports all modules witihn nixos/modules
{ ... }:
{
	imports = [
	./core/bootloader.nix
	#./core/kernel.nix
	./keyboard.nix
	#./nvim/config.nix
	./desktop/sddm.nix

	./fonts.nix
	];
}
