{ config, ... }:
{
  environment.etc."libinput-gestures.conf" = {
    text = ''
      # 3 finger swipe up: move to previous workspace
      gesture swipe up 3 hyprctl dispatch workspace previous

      # 3 finger swipe down: move to next workspace
      gesture swipe down 3 hyprctl dispatch workspace next

      # 4 finger swipe left: browser go back (using xdotool for generic app support)
      gesture swipe left 4 xdotool key alt+Left

      # 4 finger swipe right: browser go forward
      gesture swipe right 4 xdotool key alt+Right

      # Pinch in/out for overview or other functions (Example: show overview with Super+S)
      gesture pinch in xdotool key super+s
      gesture pinch out xdotool key super+s
    '';
    mode = "444"; # Read-only permissions
  };

}
