{ config, ... }:
{


    environment.etc."libinput-gestures.conf" = {
        text = ''
            # 3 finger swipe up: move to next workspace
            gesture swipe up 3 hyprctl dispatch workspace e+1

            # 3 finger swipe down: move to previous workspace
            gesture swipe down 3 hyprctl dispatch workspace e-1
        '';
        mode = "444";
    };

}
