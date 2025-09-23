{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        jxplorer
    ];
}
