{ config, pkgs, ... }: 
{

    #environment.systemPackages = with pkgs; [
    #    kdePackages.sddm
    #    sddm-chili-theme
    #    elegant-sddm
    #];
    #services.xserver.desktopManager.plasma5.enable = true;

    #services.displayManager.sddm ={
    #   enable = true;
    #    wayland.enable = true;
    #    package = pkgs.kdePackages.sddm;
    #    extraPackages = with pkgs; [
    #        #(sddm-astronaut.override { embeddedTheme = "black_hole"; })
    #        kdePackages.qtsvg
    #        kdePackages.qtmultimedia
    #        kdePackages.qtvirtualkeyboard
    #    ];
    #    theme = "sddm-chili-theme";
    #};

    # /etc/nixos/configuration.nix

    services.xserver.desktopManager.plasma6.enable = true; # Example for Plasma, which is Qt5-based
    services.displayManager.sddm = {
        enable = true;
        # SDDM will now use the Qt5 version
         package = pkgs.sddm-qt5; 
        theme = "sddm-chili-theme";
    };

    # Add the necessary Qt5 packages for your theme
    environment.systemPackages = with pkgs; [
        sddm-chili-theme
        libsForQt5.qtquickcontrols
        libsForQt5.qt5.qtgraphicaleffects
        # Add other Qt5 dependencies as needed
    ];


}
