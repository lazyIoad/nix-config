{ config, pkgs, vars, ... }: {
  imports = [
    ./hardware-configuration.nix
    ../modules/media.nix
    ../modules/fonts.nix
    ../modules/1password.nix
    ../modules/sway.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "gaius";
    networkmanager.enable = true;
  };

  services.printing.enable = true;

  environment = {
    systemPackages = with pkgs; [
      firefox
      ungoogled-chromium
      git
      vim
    ];

    variables = {
      EDITOR = "hx";
      WORKSPACE = "/home/${vars.user}/workspace";
    };
  };
}
