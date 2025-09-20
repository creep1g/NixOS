{ config, pkgs, ... }: 
{

	services.displayManager.sddm.enable = true;
	services.displayManager.sddm.theme = "Elegant";

	environment.systemPackages = with pkgs; [
		kdePackages.sddm
		elegant-sddm
	];

}
