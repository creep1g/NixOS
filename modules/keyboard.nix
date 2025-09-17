{
	services.xserver.enable = true;
	
	services.xserver.xkb.extraLayouts.custom = {
		description = "Custom US Layout";
		languages = [ "eng" ];
		symbolsFile = ./xkb/custom;
	};
}
