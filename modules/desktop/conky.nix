# Desktop widget: clock + CPU/memory info drawn on the Hyprland desktop.
# Started from Hyprland's exec-once (see ./hyprland/config.nix).
# Colours follow pywal (~/.cache/wal/colors.sh) when available.
{ pkgs, ... }:
{
  home.packages = [ pkgs.conky ];

  xdg.configFile."conky/conky.conf".text = ''
    -- Pick up pywal colours if they exist; fall back to neutral defaults.
    local wal = { color7 = 'd8dee9', color4 = '88c0d0', color8 = '4c566a' }
    local f = io.open(os.getenv('HOME') .. '/.cache/wal/colors.sh', 'r')
    if f then
      for line in f:lines() do
        local k, v = line:match("^(color%d+)='#(%x+)'")
        if k then wal[k] = v end
      end
      f:close()
    end

    conky.config = {
      out_to_wayland = true,
      out_to_x = false,

      -- 'normal' sits on the bottom layer: above the wallpaper, below windows.
      own_window = true,
      own_window_type = 'normal',
      own_window_transparent = true,
      own_window_argb_visual = true,
      own_window_argb_value = 0,

      alignment = 'top_right',
      gap_x = 40,
      gap_y = 60,
      minimum_width = 300,
      maximum_width = 300,

      update_interval = 1.0,
      double_buffer = true,
      use_xft = true,
      font = 'JetBrainsMono Nerd Font:size=11',
      draw_shades = false,
      draw_outline = false,
      draw_borders = false,
      draw_graph_borders = false,
      default_bar_height = 6,
      default_graph_height = 32,
      cpu_avg_samples = 2,
      net_avg_samples = 2,
      no_buffers = true,
      top_cpu_separate = false,

      default_color = wal.color7,
      color1 = wal.color4, -- accent
      color2 = wal.color8, -- dim
    }

    conky.text = [[
    ''${alignr}''${font JetBrainsMono Nerd Font:bold:size=48}''${time %H:%M}''${font}
    ''${alignr}''${color1}''${time %A, %d %B}''${color}
    ''${voffset 8}''${color1}CPU''${color} ''${hr 1}
    ''${freq_g} GHz''${alignr}''${cpu cpu0}%
    ''${color1}''${cpubar cpu0}''${color}
    ''${color2}''${cpugraph cpu0 32,300}''${color}
    ''${voffset 4}''${color1}MEMORY''${color} ''${hr 1}
    RAM ''${alignr}''${mem} / ''${memmax}
    ''${color1}''${membar}''${color}
    Swap ''${alignr}''${swap} / ''${swapmax}
    ''${voffset 4}''${color1}TOP''${color} ''${hr 1}
    ''${top name 1}''${alignr}''${top cpu 1}%  ''${top mem_res 1}
    ''${top name 2}''${alignr}''${top cpu 2}%  ''${top mem_res 2}
    ''${top name 3}''${alignr}''${top cpu 3}%  ''${top mem_res 3}
    ''${voffset 4}''${color2}Uptime''${alignr}''${uptime_short}''${color}
    ]]
  '';
}
