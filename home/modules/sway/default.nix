{ pkgs, specialArgs, lib, self, ... }:

let
  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text =
      let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsettings-schemas/${schema.name}";
      in
      ''
        export XDG_DATA_DIR=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
        gsettings set $gnome_schema gtk-theme 'Gruvbox-Dark-BL'
        gsettings set $gnome_schema icon-theme 'Gruvbox-Dark'
        gsettings set $gnome_schema color-scheme 1
      '';
  };
in
{
  xdg.configFile."waybar" = {
    source = ./waybar;
  };
  wayland.windowManager.sway = lib.mkIf specialArgs.withGUI {
    enable = true;
    config = {
      modifier = "Mod4";
      terminal = "wezterm";
      menu = "wofi --show run";
      bars = [{
        command = "waybar";
      }];
      window = {
        border = 0;
        hideEdgeBorders = "both";
      };
      input = {
        "type:touchpad" = {
          tap = "enabled";
          natural_scroll = "enabled";
        };
      };
      gaps = {
        inner = 8;
        outer = 8;
      };
    };
    extraConfig = ''
      output "*" bg ${self}/res/concrete.jpg fill
      exec "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
      exec configure-gtk
      default_border none
    '';
    wrapperFeatures.gtk = true;
  };

  home.packages = with pkgs; [
    configure-gtk
    glib
    gruvbox-gtk-theme
    polkit-kde-agent
    swaybg
    swaylock
    swayidle
    wl-clipboard
    mako
    wofi
    waybar
  ];
}
