{ config, pkgs, ...} :

{
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.xserver.enable = true;
  services.xserver.xkb.layout = "pl";
  services.xserver.xkb.variant = "";

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
}
