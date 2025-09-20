{ config, pkgs, ... }: 
{

	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.theme = "elegant-sddm-unstable";

	environment.systemPackages = with pkgs; [
		kdePackages.sddm
		elegant-sddm-unstable
	];

}
