{ config, pkgs, lib, ... }:
{

	services.xserver.libinput = {
		enable = true;

		touchpad = {
			enable = true;
			tapping = true;
			naturalScrolling = true;
			scrollMethod = "twofinger";
		};
		
		mouse = {
			enable = true;
			accelProfile = "flat";
			middleEmulation = false;
		};

		devices = [
			{
				match = "pointer:ELECOM TrackBall Mouse HUGE TrackBall";
				options = {
					"ButtonScrollingButton" = "12";
					"ScrollMethod" = "button";
				};
			}
		];
	};
	environment.systemPackgase = with pkgs; [
		libinput
	];
}
