{ config, pkgs, ... }: 
{

    environment.systemPackages = with pkgs; [
        sddm-astronaut-theme
            
    ];

    services.displayManager.sddm ={
       enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        extraPackages = with pkgs; [
            #(sddm-astronaut.override { embeddedTheme = "black_hole"; })
            kdePackages.qtsvg
            kdePackages.qtmultimedia
            kdePackages.qtvirtualkeyboard
        ];
        theme = "sddm-astronaut-theme";
    };


    services.xserver.desktopManager.plasma6.enable = true; # Example for Plasma, which is Qt5-based


}
