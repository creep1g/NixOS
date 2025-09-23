{ config, pkgs, lib, ... }: 
let

   simple-sddm-theme = pkgs.stdenv.mkDerivation {
        pname = "simple-sddm-2";
        version = "2.0";
        
        src = pkgs.fetchFromGitHub {
            owner = "creep1g";
            repo = "simple-sddm-2";
            rev = "a1b3ab76f8f7d2141d1060a0e99ff1f6ef08b45f";
            sha256 = "I4Df7YnpA47Z4bAYyIskRiz2HyqBnl/lrEfcNdTAVcc="; # lib.fakeSha256;
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
	qt6.qtsvg
   	kdePackages.qtmultimedia
  	qt6.qtvirtualkeyboard
            
    ];

    services.displayManager.sddm ={
       enable = true;
        wayland.enable = true;
        package = pkgs.kdePackages.sddm;
        extraPackages = with pkgs; [
            sddm-astronaut
            simple-sddm-theme
        ];
        theme = "simple-sddm-theme";
        settings = {
            Theme = {
                Current = "simple-sddm-theme";
            };
        };
    };


  #  services.desktopManager.plasma6.enable = true; 


}
