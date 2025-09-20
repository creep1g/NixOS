{ config, pkgs, environment, ... }: 
{

	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.theme = "elegant";

	environment.systemPackages = with pkgs; [
		kdePackages.sddm
		elegant-sddm
	];

}
