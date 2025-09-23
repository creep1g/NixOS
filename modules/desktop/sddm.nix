{ config, pkgs, ... }: 
{

    environment.systemPackages = with pkgs; [
        kdePackages.sddm
        sddm-chili-theme
        elegant-sddm
        libsForQt5.qt5.qtquickcontrols
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
        theme = "sddm-chili-theme";
    };



}
