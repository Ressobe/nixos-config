{ config, pkgs, ...}: {
	home = {
		username = "relow";
		homeDirectory = "/home/relow";
		stateVersion = "24.05";

		packages = with pkgs; [
			neovim
      btop
			tree
      qbittorrent
      python313
      yt-dlp
		];
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
}
