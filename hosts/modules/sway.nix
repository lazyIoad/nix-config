{ pkgs, ... }: {
  hardware.opengl.enable = true;
  programs.dconf.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        # Supposedly I shouldn't need to use dbus-run-session below since it should
        # be taken care of by the sway wrapper. But xdg-open doesn't seem to work
        # without it so...........
        command = ''${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd "dbus-run-session sway" --user-menu --asterisks --remember-session'';
      };
    };
  };

  security = {
    polkit.enable = true;

    pam.services = {
      greetd.enableGnomeKeyring = true;
      swaylock = {
        text = "auth include login";
      };
    };
  };

  services.gnome.gnome-keyring.enable = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    config = {
      common = {
        default = [
          "gtk"
        ];
      };
    };
  };
}
