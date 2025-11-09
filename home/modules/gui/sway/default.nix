{ pkgs, lib, ... }:
let
  mod = "Mod4";
in
{
  imports = [
    ../foot.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
    ./wofi.nix
  ];

  programs.swayimg.enable = true;

  home.packages = with pkgs; [
    grim
    mako
    slurp
    wl-clipboard
  ];

  wayland.windowManager.sway = {
    enable = true;
    config = {
      modifier = mod;
      keybindings = lib.attrsets.mergeAttrsList [
        (lib.attrsets.mergeAttrsList (
          map
            (
              num:
              let
                ws = toString num;
              in
              {
                "${mod}+${ws}" = "workspace ${ws}";
                "${mod}+Shift+${ws}" = "move container to workspace ${ws}";
              }
            )
            [
              1
              2
              3
              4
              5
              6
              7
              8
              9
              0
            ]
        ))

        (lib.attrsets.concatMapAttrs
          (key: direction: {
            "${mod}+${key}" = "focus ${direction}";
            "${mod}+Shift+${key}" = "move ${direction}";
          })
          {
            h = "left";
            j = "down";
            k = "up";
            l = "right";
          }
        )

        {
          "${mod}+Return" = "exec --no-startup-id ${pkgs.foot}/bin/foot";
          "${mod}+space" = "exec --no-startup-id ${pkgs.wofi}/bin/wofi --allow-images --show drun,run";
          "Alt+Tab" = "exec swayr switch-window";

          "${mod}+x" = "kill";

          "${mod}+a" = "focus parent";
          "${mod}+e" = "layout toggle split";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+g" = "split h";
          "${mod}+s" = "layout stacking";
          "${mod}+v" = "split v";
          "${mod}+w" = "layout tabbed";

          "${mod}+bracketright" = "workspace next";
          "${mod}+bracketleft" = "workspace prev";
          "${mod}+Shift+bracketright" = "move container to workspace next";
          "${mod}+Shift+bracketleft" = "move container to workspace prev";

          "${mod}+Shift+r" = "exec swaymsg reload";
          "--release Print" = "exec --no-startup-id ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
          "Ctrl+Alt+l" = "exec swaylock";
          "${mod}+Ctrl+q" = "exit";
        }
      ];

      bars = [ ];
      defaultWorkspace = "workspace 1";
      focus.followMouse = true;
      input."type:touchpad" = {
        dwt = "enabled";
        tap = "enabled";
        natural_scroll = "enabled";
      };
      output."*".scale = "1.5";
      startup = [
        {
          command = "systemctl --user restart waybar";
          always = true;
        }
        {
          command = "systemctl --user restart swayidle";
          always = true;
        }
        {
          command = "systemctl --user restart swayr";
          always = true;
        }
        {
          command = "exec nm-applet --indicator";
          always = true;
        }
      ];
      terminal = "${pkgs.foot}/bin/foot";
      workspaceAutoBackAndForth = true;
    };
    systemd.enable = true;
    wrapperFeatures.gtk = true;
  };
}
