{ config, ... }:
{
	# Bootloader
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.grub.enable = false; # optional, but avoids confusion
}
