{ config, pkgs, ...} :

{
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
