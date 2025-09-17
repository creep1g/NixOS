{
	services.xserver.enable = true;
	
	services.xserver.extraLayouts.custom = {
		description = "Custom US Layout";
		languages = [ "eng" ];
		symbolsFile = ./custom
	};
}
