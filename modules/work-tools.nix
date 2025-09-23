{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        jxplorer
        (writeShellScriptBin "jxplorer-wrapped" ''
            JXPLORER_DIR="${pkgs.jxplorer}/opt/jxplorer"
    
            cd "$JXPLORER_DIR"
            exec "./jxplorer.sh" "-Djxplorer.config=$HOME/.local/jxplorer" "$@"
        '')
    ];

}
