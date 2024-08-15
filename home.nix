{ config, pkgs, ...}: {

  imports = [
    ./user/fish.nix
    ./user/git.nix
    ./user/alacritty.nix
    ./user/wofi.nix
    ./user/waybar.nix
    ./user/hyprland.nix
  ];

	home = {
		username = "relow";
		homeDirectory = "/home/relow";
		stateVersion = "24.11";

		packages = with pkgs; [
			neovim
      nom
      fastfetch
      pfetch
      btop
			tree
      qbittorrent
      python313
      yt-dlp
      rsync
      firefox
      turso-cli
      tor-browser
      lazygit
      dotnet-sdk_8
      libreoffice
      unzip
      zed-editor
      termusic
      lua-language-server
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
