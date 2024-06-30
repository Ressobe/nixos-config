{ config, pkgs, ... }:

{
  imports =
    [
      ./system/hardware-configuration.nix
      ./system/services.nix
      ./system/programs.nix
      ./system/stylix.nix
    ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

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

  # Configure console keymap
  console.keyMap = "pl2";

  users.users.relow = {
    isNormalUser = true;
    description = "Relow";
    extraGroups = [ "networkmanager" "wheel" "video" ];
    shell = pkgs.fish;
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

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
  system.autoUpgrade.enable = true;

  system.stateVersion = "24.11";
}
