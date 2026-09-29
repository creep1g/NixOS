{ pkgs, ... }:
{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    logRefusedConnections = true;
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
    allowPing = true;
    checkReversePath = "loose"; # avoid issues with routed/VPN traffic
  };

  environment.systemPackages = [ pkgs.networkmanagerapplet ];
}
