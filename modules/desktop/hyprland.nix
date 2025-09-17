{ config, pkgs, ... }:

{
	programs.hyprland = {
		enable = true;
		xwayland.enable = true;
	};

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      # Variables
      "$scripts" = ".config/hypr/scripts";
      "$mainMod" = "CTRL";

      monitor = [
        "eDP-1, 1920x1200, 1920x2160,1"
        "DP-1, 5120x2160, 0x0, 1"
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
        col.active_border = "$color11 rgba(59595900) $color14 45deg";
        col.inactive_border = "rgba(59595900)";
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

      device."elecom-trackball-mouse-huge-trackball-1" = {
        scroll_button = 12;
        scroll_method = "continuous";
      };

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

