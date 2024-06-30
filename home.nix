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
		];
	};

  programs.git = {
    enable = true;
    userName = "Ressobe";
    userEmail = "bartosz.sobina44@gmail.com";

    aliases = {
      d = "diff";
      co = "checkout";
      ci = "commit";
      ca = "commit -a";
      ps = "push";
      pl = "pull";
      br = "branch";
    };

    extraConfig = {
      push = {
        default = "simple";
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
