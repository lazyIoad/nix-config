{ pkgs, ... }: {
  hardware.opengl.enable = true;
  programs.dconf.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway --user-menu --asterisks --remember";
      };
    };
  };

  security = {
    polkit.enable = true;

    pam.services.swaylock = {
      text = "auth include login";
    };
  };

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };
}
