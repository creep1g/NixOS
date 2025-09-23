{config, ... }:

{
    networking.hostname = "nixos"
    networking.wireless.enable = true; 
    networking.networkmanager.enable = true;

    networking.firewall = {
        enable = true;                # firewall on
        logRefusedConnections = true; # Logging (low)
        allowedTCPPorts = [];         # No incoming TCP allowed
        allowedUDPPorts = [];         # No incoming UDP allowed
        allowPing = true;             # optional, set to false to block ping
    };

    # Explicit defaults (already match UFW defaults you want)
    networking.firewall.checkReversePath = "loose"; # prevent issues with routed traffic

    # Optional: extra rules for dropping invalid packets
    networking.firewall.extraCommands = ''
        nft add rule inet filter input ct state invalid drop
        nft add rule inet filter forward drop
    '';
        

}
