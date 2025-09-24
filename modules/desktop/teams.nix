
{ config, pkgs, lib, ... }:

let
  # Define a new, custom package called "teams-for-linux-optimized"
  # This package is a modified version of the standard teams-for-linux package.
  tfl = pkgs.teams-for-linux.overrideAttrs (oldAttrs: {
    # The `postFixup` phase is where you can add custom wrapping logic to a package.
    # This ensures that the flags are applied every time the binary is executed.
    postFixup = ''
      # The wrapProgram utility adds flags to the executable script.
      wrapProgram $out/bin/teams-for-linux \
        --add-flags "--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"
    '';
  });

in

{

  # Set the crucial environment variable to enable Wayland for Electron apps.
  # This tells Electron to use the Wayland-native backend (Ozone).
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Enable the X11 windowing system to ensure XWayland is available for
  # applications that don't yet support Wayland natively.
  services.xserver.enable = true;

  # Ensure the Intel video drivers are enabled.
  services.xserver.videoDrivers = [ "intel" ];

  # Enable OpenGL for graphics acceleration.
  hardware.opengl.enable = true;
  environment.systemPackages = with pkgs; [
  			     tfl
	];

  
}