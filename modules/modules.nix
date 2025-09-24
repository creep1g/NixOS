# Imports all modules witihn nixos/modules
{ ... }:
{
	imports = [
	./core/network.nix
	./core/bootloader.nix
	./core/intel.nix
	#./core/kernel.nix
	./pywal.nix
	./keyboard.nix
	./work-tools.nix
	#./nvim/config.nix
	./desktop/sddm.nix
	./destkop/doomemacs.nix
	./fonts.nix
	];
}
