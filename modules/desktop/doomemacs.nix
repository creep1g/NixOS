{ config, lib, pkgs, inputs, ... }:

{
    environment.systemPackages = with pkgs; [
        emacs
        emacsPackages.doom
        emacPackages.ewal-doom-themes    
    ];
}

