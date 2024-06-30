{ config, pkgs, ...}: {

  imports = [
    ./user/fish.nix
    ./user/git.nix
    ./user/alacritty.nix
    ./user/wofi.nix
    ./user/waybar.nix
  ];

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
}
