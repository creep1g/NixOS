{ config, pkgs, ... }: 
{

	environment.systemPackages = with pkgs; [
		kdePackages.sddm
		sddm-chili-theme
		elegant-sddm
	];

	services.xserver.displayManager.sddm ={
		enable = true;
	        theme = "chilio";
	};



}
