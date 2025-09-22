{ config, pkgs, ... }: 
{

	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.theme = "sddm-elegant";

	environment.systemPackages = with pkgs; [
		kdePackages.sddm
		elegant-sddm
	];

}
