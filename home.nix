{ config, pkgs, ...}: {
	home = {
		username = "relow";
		homeDirectory = "/home/relow";
		stateVersion = "24.05";

		packages = with pkgs; [
			neovim
      fastfetch
      pfetch
      btop
			tree
      qbittorrent
      python313
      yt-dlp
      rsync
		];
	};

	home.pointerCursor = {
		package = pkgs.vanilla-dmz;
      		name = "Vanilla-DMZ";
      		size = 24;
      		gtk.enable = true;
      		x11 = {
        		enable = true;
        		defaultCursor = true;
      		};
	};

  programs.git = {
    enable = true;
    userName = "Ressobe";
    userEmail = "bartosz.sobina44@gmail.com";

    aliases = {
      s = "status";
      d = "diff";
      co = "checkout";
      ci = "commit";
      ca = "commit -a";
      ps = "push";
      pl = "pull";
      br = "branch";
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
          set fish_greeting # Disable greeting
    '';
    shellAbbrs = {
      c = "clear";
      n = "nvim";
      ls = "eza --icons";
      l = "eza --icons ";
      ll = "eza --icons -ahl";
      lt = "eza --tree";
      cd = "z";
      g = "git";
    };
    functions = {
      fish_prompt = {
        body = ''
          set_color red --bold
          printf "["
          set_color yellow
          printf "%s" "$USER"
          set_color green
          printf "@"
          set_color blue
          printf "%s" "$hostname"
          set_color magenta
          printf " %s" "$PWD"
          set_color red
          printf "] "
          set_color normal
        '';
      };
    };
    shellInitLast = "zoxide init fish | source | fish_config theme choose Dracula";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      font = {
        size = 12;
        normal = {
          family = "Hack Nerd Font";
          style = "Normal";
        };
      };
      window = {
        opacity = 1.0;
        padding.x = 15;
        padding.y = 15;
      };

      colors = {
        primary = {
          background = "#11111b";
          foreground = "#cdd6f4";
          dim_foreground = "#7f849c";
          bright_foreground = "#cdd6f4";
        };

        cursor = {
          text = "#1e1e2e";
          cursor = "#f5e0dc";
        };

        vi_mode_cursor = {
          text = "#1e1e2e";
          cursor = "#b4befe";
        };

        search.matches = {
          foreground = "#1e1e2e";
          background = "#a6adc8";
        };

        search.focused_match = {
          foreground = "#1e1e2e";
          background = "#a6e3a1";
        };

        footer_bar = {
          foreground = "#1e1e2e";
          background = "#a6adc8";
        };

        hints.start = {
          foreground = "#1e1e2e";
          background = "#f9e2af";
        };

        hints.end = {
          foreground = "#1e1e2e";
          background = "#a6adc8";
        };

        selection = { 
          text = "#1e1e2e";
          background = "#f5e0dc";
        };

        normal = {
          black = "#45475a";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#bac2de";
        };

        bright = {
          black = "#585b70";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#a6adc8";
        };

        dim = {
          black = "#45475a";
          red = "#f38ba8";
          green = "#a6e3a1";
          yellow = "#f9e2af";
          blue = "#89b4fa";
          magenta = "#f5c2e7";
          cyan = "#94e2d5";
          white = "#bac2de";
        };

      };
    };
  };

  programs.wofi = {
    enable = true;
    settings = {
      mode = "drun";
      allow_images = true;
    };

    style = ''
      /* Mocha Pink */
      @define-color accent #cba6f7;
      @define-color txt #cdd6f4;
      @define-color bg #11111b;
      @define-color bg2 #313244;

      * {
          font-family: 'Hack Nerd Font';
          font-size: 14px;
          font-weight: bold;
      }

       /* Window */
       window {
          margin: 0px;
          padding: 10px;
          border: 3px solid @accent;
          border-radius: 7px;
          background-color: @bg;
          animation: slideIn 0.2s ease-in-out both;
      }

      /* Slide In */
      @keyframes slideIn {
          0% {
             opacity: 0;
          }

          100% {
             opacity: 1;
          }
      }

      /* Inner Box */
      #inner-box {
          margin: 5px;
          padding: 10px;
          border: none;
          background-color: @bg;
          animation: fadeIn 0.2s ease-in-out both;
      }

      /* Fade In */
      @keyframes fadeIn {
          0% {
             opacity: 0;
          }

          100% {
             opacity: 1;
          }
      }

      /* Outer Box */
      #outer-box {
          margin: 5px;
          padding: 10px;
          border: none;
          background-color: @bg;
      }

      /* Scroll */
      #scroll {
          margin: 0px;
          padding: 10px;
          border: none;
      }

      /* Input */
      #input {
          margin: 5px;
          padding: 10px;
          border: none;
          color: @accent;
          background-color: @bg2;
          animation: fadeIn 0.2s ease-in-out both;
       }

      /* Text */
      #text {
          margin: 5px;
          padding: 10px;
          border: none;
          color: @txt;
          animation: fadeIn 0.2s ease-in-out both;
      }

      /* Selected Entry */
      #entry:selected {
         background-color: @accent;
      }

      #entry:selected #text {
          color: @bg;
      }
    '';
  };

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        output = "eDP-1";
        layer = "top";
        position = "top";
        height = 6;

        modules-left = [
          "custom/distro-icon"
          "hyprland/workspaces"
          "wireplumber"
          "backlight"
        ];

        modules-center = [
          "memory"
          "wlr/taskbar"
          "cpu"
        ];
        
        modules-right = [
          "network"
          "battery"
          "clock"
        ];

        backlight = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [
            "󰛩"
            "󱩑"
            "󱩓"
            "󰛨"
          ];
        };

        "custom/distro-icon" = {
          format = "󱄅";
          tooltip = false;
          on-click = "wofi";
        };

        battery = {
          interval = 10;
          states = {
            warning = 20;
            critical = 10;
          };
          format = "{icon} {capacity}%";
          format-icons = [ 
            " "
            " "
            " "
            " "
            " "
          ];
          format-full = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          tooltip = true;
        };

        clock = {
          interval = 1;
          format = "󰥔  {:%H:%M}";
          format-alt = "  {:%d-%m-%Y}";
        };

        memory = {
          interval = 1;
          format = "󰍛 {percentage}%";
          states = {
            warning = 85;
          };
        };

        cpu = {
          interval = 1;
          format = "󰻠 {usage}%";
        };

        network = {
          interval = 1;
          format-wifi = "  {signalStrength}%";
          format-ethernet = "  {ifname} ({ipaddr})";
          format-linked = " {essid} (No IP)";
          format-disconnected = " Disconnected";
          tooltip = false;
        };

        tray = {
          icon-size = 15;
          spacing = 5;
        };

        "wlr/taskbar" = {
            format = "{icon}";
            icon-size = 25;
            icon-theme = "Numix-Circle";
            tooltip = false;
            on-click =  "activate";
            on-click-middle = "close";
            ignore-list = [
                "Alacritty"
            ];
        };

        wireplumber = {
          format = "{icon}  {volume}%";
          format-muted = " Muted";
          format-icons = [
            ""
            ""
            "󰕾"
            ""
          ];
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          tooltip = false;
        };
      };
    };
    style = ''

* {
  font-family: "Hack Nerd Font";
  font-size: 10pt;
  font-weight: normal;
}

@keyframes blink_red {
  to {
    background-color: rgb(242, 143, 173);
    color: rgb(26, 24, 38);
  }
}

.warning,
.critical,
.urgent {
  animation-name: blink_red;
  animation-duration: 1s;
  animation-timing-function: linear;
  animation-iteration-count: infinite;
  animation-direction: alternate;
}

window#waybar {
  background-color: transparent;
}

window > box {
  padding: 3px;
}

#custom-distro-icon {
  font-size: 22pt;
  padding-left: 10px;
  padding-right: 16px;
  border-radius: 9px;
  /*
  color: #C0C2C9;
  background: #09090F;*/

  background: #6366f1;
  background: linear-gradient(to right, #6366f1 0%, #10b981 100%);
  -webkit-text-fill-color: transparent;
}

#taskbar {
  padding: 1px 5px 1px 5px;
  background: #09090f;
  border-radius: 9px;
  border: none;
  min-width: 45px;
  margin-left: 5px;
  margin-right: 5px;
  /* border: 0.7px solid #cba6f7; */
}

#workspaces {
  padding: 3px 6px 3px 6px;
  margin-left: 20px;
  margin-right: 10px;
  border-radius: 9px;
  background: #09090f;
  /* border: 0.7px solid #cba6f7; */
}

#workspaces button {
  padding: 2px 6px 2px 6px;
}

#workspaces button.active {
  background-color: #62b3b2;
  color: rgb(26, 24, 38);
}

#workspaces button.urgent {
  color: rgb(26, 24, 38);
}

#workspaces button:hover {
  background-color: rgb(248, 189, 150);
  color: rgb(26, 24, 38);
}

tooltip {
  background: rgb(48, 45, 65);
}

tooltip label {
  color: rgb(217, 224, 238);
}

#mode,
#clock,
#memory,
#temperature,
#cpu,
#temperature,
#backlight,
#pulseaudio,
#network,
#battery,
#wireplumber {
  padding: 0px 12px;
  background: #09090f;
  margin-right: 10px;
  border-radius: 9px;
  /* border: 0.7px solid #cba6f7; */
}

#wireplumber {
  color: #00bfff;
}

#memory {
  color: rgb(181, 232, 224);
  margin-right: 0px;
}

#cpu {
  color: rgb(245, 194, 231);
}

#clock {
  color: rgb(217, 224, 238);
}

#idle_inhibitor {
  color: rgb(221, 182, 242);
}

#temperature {
  color: rgb(150, 205, 251);
}

#backlight {
  color: rgb(248, 189, 150);
}

#pulseaudio {
  color: rgb(245, 224, 220);
}

#network {
  color: #abe9b3;
}

#network.disconnected {
  color: rgb(255, 255, 255);
}

#battery.charging,
#battery.full,
#battery.discharging {
  color: rgb(250, 227, 176);
}

#battery.critical:not(.charging) {
  color: rgb(242, 143, 173);
}
    '';
  };
}
