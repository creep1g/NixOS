{ config, ... }:
{
	# Bootloader
	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;
	boot.loader.grub.enable = false; # optional, but avoids confusion
	# Grub because i suck at VMS
	#boot.loader.grub.enable = true;
	#boot.loader.grub.device = "/dev/nvme0n1p1";
	#boot.loader.grub.useOSProber = true;
}
