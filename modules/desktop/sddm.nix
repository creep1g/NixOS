{ config, pkgs, ... }: 
{

   environment.systemPackages = with pkgs; [
       kdePackages.sddm
       sddm-chili-theme
       elegant-sddm

    ];

    services.displayManager.sddm ={
        enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        extraPackages = with pkgs; [
            (sddm-astronaut.override { embeddedTheme = "black_hole"; })
            kdePackages.qtsvg
            kdePackages.qtgraphicaleffects
            kdePackages.qtmultimedia
            kdePackages.qtvirtualkeyboard
        ];
        theme = "elegant-sddm";
    };



}
