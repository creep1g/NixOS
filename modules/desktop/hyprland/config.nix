{ config, pkgs, lib, hyprland, ... }:

{
   wayland.windowManager.hyprland = {
    enable = true;
    # Use the hyprland package from the flake input
    package = hyprland.packages.${pkgs.system}.hyprland;


    settings = {
      # Variables
      "$scripts" = "$HOME/Dotfiles/.config/hypr/scripts";
      "$mainMod" = "CTRL";

      monitor = [
        "eDP-1, 1920x1200, 1920x2160,1"
        "DP-1, 5120x2160, 0x0, 1"
	"Virtual-1, 0x0, 1"
      ];

      bindl = [
        ",switch:Lid Switch, exec, ~/.config/hypr/scripts/switch.sh"
      ];

      workspace = [
        "1,monitor:eDP-1"
        "2,monitor:eDP-1"
        "3,monitor:eDP-1"
        "4,monitor:eDP-1"
        "5,monitor:eDP-1"
        "6,monitor:DP-1, layout:master"
        "7,monitor:DP-1, layout:master"
        "8,monitor:DP-1, layout:master"
        "9,monitor:DP-1, layout:master"
        "10,monitor:DP-1, layout:master"
      ];

      exec-once = [
        "$scripts/initWallpaper"
        "$scripts/initWaybar"
        "$scripts/xdgdesktop"
        "$scripts/gtkthemes"
        "/usr/lib/polkit-kde-authentication-agent-1"
      ];

      source = [
        "/home/gilli/.cache/wal/colors-hyprland.conf"
      ];

      env = [
        "XCURSOR_SIZE,18"
	"XCURSOR_THEME,Thono"
      ];

      xwayland = {
        force_zero_scaling = true;
      };
      input = {
        kb_layout = "custom";
        kb_variant = "dvorak";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad.natural_scroll = true;
      };

      cursor.no_hardware_cursors = true;

      general = {
        gaps_in = 5;
        gaps_out = 6;
        border_size = 3;
        "col.active_border" = "$color11 rgba(59595900) $color14 45deg";
        "col.inactive_border" = "rgba(59595900)";
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        shadow = {
          enabled = true;
          range = 5;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        fullscreen_opacity = 1.0;
        blur = {
          enabled = false;
          size = 10;
          passes = 3;
          ignore_opacity = true;
          new_optimizations = true;
        };
      };

      animations = {
        enabled = true;
        bezier = [ "myBezier, 0.05, 0.9, 0.1, 1.0" ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, myBezier, popin 80%"
          "border, 1, 10, myBezier"
          "borderangle, 1, 8, myBezier"
          "fade, 1, 7, myBezier"
          "workspaces, 1, 6, myBezier"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        orientation = "center";
        slave_count_for_center_master = 0;
        mfact = 0.5;
        always_keep_position = true;
      };

      #device."elecom-trackball-mouse-huge-trackball-1" = {
      #  scroll_button = 12;
      #  scroll_method = "continuous";
      #};

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };

      # Binds (example subset, you can copy the rest in same style)
      bind = [
        "$mainMod, RETURN, exec, kitty"
        "$mainMod SHIFT, RETURN, exec, kitty ranger"
        "$mainMod, S, togglefloating"
        "$mainMod CTRL, SPACE, exec, .config/rofi/scripts/websearch"
        "$mainMod, SPACE, exec, .config/rofi/scripts/launcher"
        "$mainMod, F, fullscreen"
        "$mainMod, Q, killactive"
        "$mainMod, T, exec, urxvt"
        "$mainMod, W, exec, .config/rofi/scripts/wallpaper"
        "$mainMod SHIFT, W, exec, .config/waybar/scripts/wallpaper.sh"
	
	"$mainMod, left, movefocus, l"
	"$mainMod, right, movefocus, r"
	"$mainMod, up, movefocus, u"
	"$mainMod, down, movefocus, d"
	

	"$mainMod SHIFT, 1, movetoworkspace, 1"
	"$mainMod SHIFT, 2, movetoworkspace, 2"
	"$mainMod SHIFT, 3, movetoworkspace, 3"
	"$mainMod SHIFT, 4, movetoworkspace, 4"
	"$mainMod SHIFT, 5, movetoworkspace, 5"
	"$mainMod SHIFT, 6, movetoworkspace, 6"
	"$mainMod SHIFT, 7, movetoworkspace, 7"
	"$mainMod SHIFT, 8, movetoworkspace, 8"
	"$mainMod SHIFT, 9, movetoworkspace, 9"
	"$mainMod SHIFT, 0, movetoworkspace, 10"
	"$mainMod CTRL, 1, movetoworkspacesilent, 1"
	"$mainMod CTRL, 2, movetoworkspacesilent, 2"
	"$mainMod CTRL, 3, movetoworkspacesilent, 3"
	"$mainMod CTRL, 4, movetoworkspacesilent, 4"
	"$mainMod CTRL, 5, movetoworkspacesilent, 5"
	"$mainMod CTRL, 6, movetoworkspacesilent, 6"
	"$mainMod CTRL, 7, movetoworkspacesilent, 7"
	"$mainMod CTRL, 8, movetoworkspacesilent, 8"
	"$mainMod CTRL, 9, movetoworkspacesilent, 9"
	"$mainMod CTRL, 0, movetoworkspacesilent, 10"
	", Print, exec, $scripts/screenshot --area"

	"$mainMod, Print, exec, $scripts/screenshot --now"
	", xf86monbrightnessup, exec, $scripts/brightness --inc"
	", xf86monbrightnessdown, exec, $scripts/brightness --dec"
	", xf86audioraisevolume, exec, $scripts/volume --inc"
	", xf86audiolowervolume, exec, $scripts/volume --dec"


      ];


      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
	      ];

      windowrulev2 = [
        "workspace 2, class:^(code)$"
        "monitor 0, class:^com-ca-directory-jxplorer-JXplorer$"
        "move 100 100, class:^com-ca-directory-jxplorer-JXplorer$"
        "workspace 3, class:^(firefox)$"
        "opacity 1.0 override, class:^(firefox)$"
        "workspace 4, class:^(craft—afreshtakeondocuments-nativefier-e0958b)$"
        "workspace 4, class:^(jxplorer.sh)$"
        "workspace 5, title:^(ranger)$"
        "workspace 6, class:^(discord)$"
        "workspace 7, class:^(Cider)$"
        "move 0 0, title:^(flameshot)$"
        "opacity 1, xwayland 1, class:^(Apache Directory Studio)$"
      ];
    };
  };
}

