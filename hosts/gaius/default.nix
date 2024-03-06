{ config, pkgs, vars, ... }: rec {
  imports = [
    ./hardware-configuration.nix
    ../modules/media.nix
    ../modules/fonts.nix
    ../modules/1password.nix
    ../modules/sway.nix
    ../modules/power.nix
  ];

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      # useOSProber = true; # uncomment as needed
      efiSupport = true;
      configurationLimit = 5;
      default = "saved";
    };
    efi.canTouchEfiVariables = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  system.stateVersion = "23.11";

  networking = {
    hostName = "gaius";
    networkmanager.enable = true;
  };

  console.colors = [
    "1d2021"
    "3c3836"
    "504945"
    "665c54"
    "bdae93"
    "d5c4a1"
    "ebdbb2"
    "fbf1c7"
    "fb4934"
    "fe8019"
    "fabd2f"
    "b8bb26"
    "8ec07c"
    "83a598"
    "d3869b"
    "d65d0e"
  ];

  services.printing.enable = true;
  services.udisks2.enable = true;

  environment = {
    systemPackages = with pkgs; [
      firefox
      ungoogled-chromium
      git
      unzip
      vim
      xdg-utils
    ];

    variables = {
      EDITOR = "nvim";
      WORKSPACE = "/home/${vars.user}/workspace";
      MOZ_DBUS_REMOTE =
        "1"; # https://github.com/swaywm/sway/wiki#i-cant-open-links-in-external-applications-in-firefox
    };
  };

  programs.light.enable = true;
  # services.tailscale.enable = true;
  services.dbus.enable = true;
}
