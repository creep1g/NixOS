{ config, lib, pkgs, inputs, ... }:

{
    environment.systemPackages = with pkgs; [
        emacs
        emacsPackages.doom
        emacsPackages.ewal-doom-themes    
    ];
}

