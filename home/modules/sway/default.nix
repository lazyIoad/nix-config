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
      menu = "fuzzel";
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
      keybindings = lib.mkOptionDefault {
        "XF86MonBrightnessDown" = "exec light -U 10";
        "XF86MonBrightnessUp" = "exec light -A 10";
        "XF86AudioRaiseVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'";
        "XF86AudioLowerVolume" = "exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'";
        "XF86AudioMute" = "exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'";
      };
    };
    extraConfig = ''
      output "*" bg ${self}/res/concrete.jpg fill
      exec "${pkgs.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
      exec configure-gtk
      default_border none
    '';
    wrapperFeatures = {
      base = true;
      gtk = true;
    };
  };

  home.packages = with pkgs; [
    configure-gtk
    glib
    gruvbox-gtk-theme
    mako
    polkit-kde-agent
    swaybg
    swayidle
    swaylock
    waybar
    wev
    wl-clipboard
    xdg-utils
  ];

  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "wezterm";
        layer = "overlay";
        font = "FiraCode Nerd Font Mono:size=8";
      };
      colors = {
        background = "282828ff";
        text = "ddc7a1ff";
        match = "ea6962ff";
        selection = "ddc7a1ff";
        selection-text = "282828ff";
        selection-match = "ea6962ff";
      };
      border = {
        width = 0;
        radius = 0;
      };
    };
  };
}
