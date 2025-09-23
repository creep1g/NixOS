{config, pkgs, lib, ... }:

{
	environment.systemPackages = with pkgs; [
		ufw
	];

	services.ufw = {
		enable = true;
		defaultDenyIncoming = true;
		defaultAllowOutgoing = true;
		allowForward = false;
		logging = "low";
	};

}
