{ config, pkgs, ... }: 
{

	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.theme = "elegant-sddm";

	environment.systemPackages = with pkgs; [
		kdePackages.sddm
		elegant-sddm
	];

}
