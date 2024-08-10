{ config, pkgs, ...} :

{
  programs.fish.enable = true;

  programs.light.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  virtualisation.docker.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "2";
    GDK_SCALE=2;
  };

  environment.systemPackages = with pkgs; [
     openssl
     libgcc
     gcc
     home-manager
     wget
     bat
     vim 
     brave
     zoxide
     eza
     git
     waybar
     swww

     dunst
     libnotify
     alacritty
     wofi
     tmux
     discord
     obsidian
     pwvucontrol

     rustc
     cargo
     go
     nodejs
     bun
  
     gleam
     wl-clipboard
     sxiv
     ripgrep
     mpv
     grim
     blueberry
     slurp

     (catppuccin-sddm.override {
        flavor = "mocha";
        font  = "Noto Sans";
        fontSize = "10";
        background = "${/home/relow/wallpapers/solids/bkg1.png}";
        loginBackground = true;
     })
  ];
}
