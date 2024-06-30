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
