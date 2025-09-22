{ config, pkgs, ... }: 
{

	environment.systemPackages = with pkgs; [
		kdePackages.sddm
		sddm-chili-theme
		elegant-sddm
	];

	services.displayManager.sddm ={
		enable = true;
	        theme = "${pkgs.ssddm-chilii-theme}/share/sddm/themes/chili";
	};



}
