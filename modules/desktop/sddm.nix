{ config, pkgs, lib, ... }: 
let

   simple-sddm-theme = pkgs.stdenv.mkDerivation {
        pname = "simple-sddm-2";
        version = "2.0";
        
        src = pkgs.fetchFromGitHub {
            owner = "creep1g";
            repo = "simple-sddm-2";
            rev = "a1b3ab76f8f7d2141d1060a0e99ff1f6ef08b45f";
            sha256 = "TeYFkHFlQF77o5Xjn499uy+e8zU8cB2XajfJ1IwUCp0="; #lib.fakeSha256;
        };

        installPhase = ''
            mkdir -p $out/share/sddm/themes
            cp -r $src $out/share/sddm/themes/simple-sddm-theme
        '';
        
    };
in
{



    environment.systemPackages = with pkgs; [
        sddm-astronaut
        simple-sddm-theme
            
    ];

    services.displayManager.sddm ={
       enable = true;
        wayland.enable = true;
        #package = pkgs.kdePackages.sddm;
        extraPackages = with pkgs; [
            #(sddm-astronaut.override { embeddedTheme = "black_hole"; })
            kdePackages.qtsvg
            kdePackages.qtmultimedia
            kdePackages.qtvirtualkeyboard
        ];
        theme = "simple-sddm-theme";
    };


    services.xserver.desktopManager.plasma6.enable = true; # Example for Plasma, which is Qt5-based


}
