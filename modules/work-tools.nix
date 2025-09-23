{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        jxplorer
        (writeShellScriptBin "jxplorer-wrapped" ''
            export DISPLAY="$DISPLAY"
            export XDG_RUNTIME_DIR="$XDG_RUNTIME_DIR"
    
            exec "${pkgs.jxplorer}/opt/jxplorer/jxplorer.sh" "-Djxplorer.config=$HOME/.local/jxplorer" "$@"
        '')
    ];

}
