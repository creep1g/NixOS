# Imports all modules witihn nixos/modules
{ ... }:
{
	imports = [
	./core/network.nix
	./core/bootloader.nix
	#./core/kernel.nix
	./pywal.nix
	./keyboard.nix
	#./nvim/config.nix
	./desktop/sddm.nix

	./fonts.nix
	];
}
