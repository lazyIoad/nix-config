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
    systemd-boot = {
      enable = true;
      configurationLimit = 5;
    };
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "gaius";
    networkmanager.enable = true;
  };

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
      MOZ_DBUS_REMOTE = "1"; # https://github.com/swaywm/sway/wiki#i-cant-open-links-in-external-applications-in-firefox
    };
  };

  programs.light.enable = true;
  services.tailscale.enable = true;
  services.dbus.enable = true;
}
