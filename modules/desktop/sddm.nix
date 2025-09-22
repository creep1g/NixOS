{ config, pkgs, ... }: 
{

	environment.systemPackages = with pkgs; [
		kdePackages.sddm
		sddm-chili-theme
		elegant-sddm
	];

	services.displayManager.sddm ={
		enable = true;
	        theme = "chili";
	};



}
