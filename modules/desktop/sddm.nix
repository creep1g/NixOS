{ config, pkgs, lib, ... }: 
let

   simple-sddm-theme = pkgs.stdenv.mkDerivation {
        pname = "simple-sddm-2";
        version = "1.0";
        
        src = pkgs.fetchFromGitHub {
            owner = "creep1g";
            repo = "simple-sddm-2";
            rev = "7c9f5af2f7db2bf2fc874c65c45c9dbf81b3e49d";
            sha256 = lib.fakeSha256;
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
