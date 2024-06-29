{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.power-profiles-daemon.enable = false;

  time.timeZone = "Europe/Warsaw";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };


  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = false;


  # Configure keymap in X11
  services.xserver.xkb.layout = "pl";
  services.xserver.xkb.variant = "";

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  programs.fish.enable = true;

  users.users.relow = {
    isNormalUser = true;
    description = "Relow";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    shell = pkgs.fish;
  };

  programs.light.enable = true;

  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };


  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    QT_AUTO_SCREEN_SCALE_FACTOR = "2";
    GDK_SCALE=2;
  };

  fonts = {
  	fontDir.enable = true;
	  packages = with pkgs; [
      noto-fonts
      fira-code
      fira-code-symbols
      noto-fonts-cjk
      noto-fonts-emoji
      nerdfonts
	  ];
  };

  environment.systemPackages = with pkgs; [
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
     fish
     neofetch
     waybar
     hyprpaper
     dunst
     libnotify
     alacritty
     wofi
     tmux
     discord
     obsidian
     docker
     pwvucontrol

     rustc
     cargo
     go
     nodejs
     bun
#     python
  
     gleam
     vscode
     wl-clipboard
     sxiv
     pfetch
     ripgrep
     mpv
     grim
     xfce.thunar
     blueberry
     slurp

     (catppuccin-sddm.override {
        flavor = "mocha";
        font  = "Noto Sans";
        fontSize = "10";
        background = "${/home/relow/wallpapers/wallhaven-jxj22q.png}";
        loginBackground = true;
     })
  ];

  services.displayManager.sddm = {
    enable = true;
    enableHidpi = true;
    theme = "catppuccin-mocha";

    wayland = {
      enable = true;
    };

    package = pkgs.kdePackages.sddm;

    extraPackages = with pkgs; [
      kdePackages.layer-shell-qt
    ];


    settings = {
      General = {
       GreeterEnvironment = "QT_SCREEN_SCALE_FACTORS=1.5";
       DateSize = "2";
      };
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  services.auto-cpufreq.enable = true;
  services.auto-cpufreq.settings = {
    battery = {
       governor = "powersave";
       turbo = "never";
    };
    charger = {
       governor = "performance";
       turbo = "auto";
    };
  };

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "#11111b";
      base01 = "181825";
      base02 = "313244";
      base03 = "45475a";
      base04 = "585b70";
      base05 = "cdd6f4";
      base06 = "f5e0dc";
      base07 = "b4befe";
      base08 = "f38ba8";
      base09 = "fab387";
      base0A = "f9e2af";
      base0B = "a6e3a1";
      base0C = "94e2d5";
      base0D = "89b4fa";
      base0E = "cba6f7";
      base0F = "f2cdcd";
    };
    imageScalingMode = "fill";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
