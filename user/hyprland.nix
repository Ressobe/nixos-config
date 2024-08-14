{ config, pkgs, ...} :

{
  home.file."~/.config/hypr/hyprland.conf".text = ''
      exec-once = swww init & swww img /home/relow/wallpapers/minimalistic/unicat.png & waybar
      monitor=eDP-1,2520x1680@90,auto,auto

      input {
          kb_layout = pl
          repeat_rate = 45
          repeat_delay = 350
          follow_mouse = 1
          touchpad {
              natural_scroll = yes
          }
          sensitivity = -0.1 
          kb_options = ctrl:nocaps
      }

      general {
          gaps_in = 5
          gaps_out = 6
          border_size = 1
          col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
          col.inactive_border = rgba(595959aa)
          layout = dwindle
      }

      decoration {
          rounding = 10
          drop_shadow = yes
          shadow_range = 4
          shadow_render_power = 3
          col.shadow = rgba(1a1a1aee)
          blur {
            enabled = true
          }
      }


      animations {
          enabled = yes
          bezier = myBezier, 0.04, 0.3, 0.1, .7
          animation = windows, 1, 3, myBezier
          animation = windowsOut, 1, 3, default, popin 80%
          animation = border, 1, 7, default
          animation = borderangle, 1, 8, default
          animation = fade, 1, 4, default
          animation = workspaces, 1, 4, default
      }

      dwindle {
          pseudotile = yes 
          preserve_split = yes 
      }

      master {
          # new_is_master = true
      }

      gestures {
          workspace_swipe = on
      }


      misc {
          disable_hyprland_logo = true
      }

      #windowrulev2 = workspace 3, class:^(obsidian)$
      #workspace = 1, on-created-empty:[fullscreen] alacritty
      #workspace = 2, on-created-empty:[] firefox

      workspace = 1, monitor:eDP-1
      workspace = 2, monitor:eDP-1
      workspace = 3, monitor:eDP-1
      workspace = 4, monitor:eDP-1
      workspace = 5, monitor:eDP-1
      workspace = 6, monitor:HDMI-A-1
      workspace = 7, monitor:HDMI-A-1
      workspace = 8, monitor:HDMI-A-1
      workspace = 9, monitor:HDMI-A-1

      windowrule = float, ^(thunar)$

      $mainMod = SUPER

      bind = $mainMod, return, exec, alacritty
      bind = $mainMod, Q, killactive, 
      bind = $mainMod, M, exit, 
      bind = $mainMod, E, exec, thunar
      bind = $mainMod, V, togglefloating, 

      bind = $mainMod, P, exec, wofi --show drun
      bindr= $mainMod, B, exec, pkill waybar || waybar -c /home/relow/.config/waybar/config -s /home/relow/.config/waybar/style.css

      bind = $mainMod, R, pseudo, # dwindle
      bind = $mainMod, J, togglesplit, # dwindle

      bind = $mainMod, S, exec, grim -g "$(slurp)" - | wl-copy
      bind = $mainMod, F, fullscreen, 
      bind = $mainMod, C, exec, /home/relow/scripts/powermenu.sh

      binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
      binde=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      binde=, XF86AudioMicMute, exec, wpctl set-source-mute @DEFAULT_SOURCE@ toggle
      binde=, XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle


      binde=, XF86MonBrightnessUp, exec, light -A 5
      binde=, XF86MonBrightnessDown, exec, light -U 5

      bind = $mainMod, G, exec, obsidian  --enable-features=UseOzonePlatform --ozone-platform=wayland
      bind = $mainMod, E, exec, vscodium  --enable-features=UseOzonePlatform --ozone-platform=wayland
      bind = $mainMod, D, exec, discord
      #
      #
      # Move focus with mainMod and vim motion
      bind = $mainMod, H, movefocus, l
      bind = $mainMod, L, movefocus, r
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, J, movefocus, d


      # Switch workspaces with mainMod + [1-10]
      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9

      # Move active window to a workspace with mainMod + SHIFT + [1-10]
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9

      # Scroll through existing workspaces with mainMod + scroll
      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

  '';
}
