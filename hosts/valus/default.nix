{ config, pkgs, vars, ... }: rec {
  imports = [ ./hardware-configuration.nix ];

  boot = {
    tmp.cleanOnBoot = true;

    loader = {
      efi = { efiSysMountPoint = "/boot/efi"; };

      grub = {
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
      };
    };
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

  system.stateVersion = "24.05";

  networking = {
    hostName = "valus";
    firewall.enable = true;
  };

  security.sudo.execWheelOnly = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      AllowTcpForwarding = true;
      X11Forwarding = false;
      AllowAgentForwarding = false;
      AllowStreamLocalForwarding = false;
      AuthenticationMethods = "publickey";
    };
  };

  users.users.serveruser.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHpmLmbTkIoekLsp+H47NHrBIuUIe6wyfTn1ce/CDNx7"
  ];

  services = {
    caddy = {
      enable = true;
      virtualHosts = {
        "git.lazyloading.cloud".extraConfig = ''
          reverse_proxy localhost:3000
        '';

        "fedi.lazier.computer".extraConfig = ''
          encode gzip
          reverse_proxy unix//run/akkoma/socket
        '';
      };

      email = "homelab@lazyloading.net";
    };

    forgejo = {
      enable = true;
      settings = {
        DEFAULT = { APP_NAME = "lazyforge"; };

        repository = { DEFAULT_BRANCH = "master"; };

        server = {
          DOMAIN = "git.lazyloading.cloud";
          OFFLINE_MODE = true;
          ROOT_URL = "https://git.lazyloading.cloud/";
        };

        service = { DISABLE_REGISTRATION = true; };

        database = { DB_TYPE = "sqlite3"; };
      };
    };

    postgresql.enable = true;

    akkoma = {
      enable = true;
      config = {
        ":pleroma" = {
          ":instance" = {
            name = "lazier.computer";
            email = "lazieradmin@lazyloading.net";
            description = "a quiet place for lazyload";
            registrations_open = false;
            federating = true;
            public = true;
          };

          "Pleroma.Web.Endpoint" = {
            url.host = "fedi.lazier.computer";
          };
        };
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 22 80 443 ];
}
