{ config, pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        jxplorer
        (writeShellScriptBin "jxplorer-wrapped" ''
            local JXPLORER_DIR="${pkgs.jxplorer.optDir}"
    
            exec "$JXPLORER_DIR/jxplorer.sh -Djxplorer.config=$HOME/.local/jxplorer "$@"
        '')
    ];

}
