{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        jxplorer
        (writeShellScriptBin "jxplorer-wrapped" ''
    
            exec "${pkgs.jxplorer}/opt/jxplorer/jxplorer.sh" "-Djxplorer.config=$HOME/.local/jxplorer" "$@"
        '')
    ];

}
