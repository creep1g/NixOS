
{ config, pkgs, ... }:

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
  			     teams-for-linux
	];

  packages.teams-for-linux-optimized = pkgs.teams-for-linux.overrideAttrs (oldAttrs: {
          # The `postFixup` phase is where we can add custom wrapping logic.
          postFixup = ''
            wrapProgram $out/bin/teams \
              --add-flags "--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform=wayland"
          '';
        });
}