{ pkgs, lib, ... }:
let
  mod = "Mod4";
in
{
  imports = [
    ./foot.nix
  ];

  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      width = 250;
    };
  };

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
                "${mod}+Ctrl+${ws}" = "move container to workspace ${ws}";
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
            "${mod}+Ctrl+${key}" = "move ${direction}";
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
          "${mod}+space" = "exec --no-startup-id wofi --allow-images --show drun,run";
          "Alt+Tab" = "exec swayr switch-window";

          "${mod}+x" = "kill";

          "${mod}+a" = "focus parent";
          "${mod}+e" = "layout toggle split";
          "${mod}+f" = "fullscreen toggle";
          "${mod}+g" = "split h";
          "${mod}+s" = "layout stacking";
          "${mod}+v" = "split v";
          "${mod}+w" = "layout tabbed";

          "${mod}+Shift+r" = "exec swaymsg reload";
          "--release Print" = "exec --no-startup-id ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
          "Ctrl+Alt+l" = "exec ${pkgs.swaylock-fancy}/bin/swaylock-fancy";
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
      ];
      terminal = "${pkgs.foot}/bin/foot";
      workspaceAutoBackAndForth = true;
    };
    systemd.enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainbar = {
        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "sway/scratchpad"
        ];
        modules-center = [
          "sway/window"
        ];
        modules-right = [
          # "idle_inhibitor"
          # "pulseaudio"
          "network"
          # "power-profiles-daemon"
          "cpu"
          "memory"
          "temperature"
          # "backlight"
          # "keyboard-state"
          # "sway/language"
          "battery"
          "clock"
          "tray"
          "custom/power"
        ];
        keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
            locked = "";
            unlocked = "";
          };
        };
        "sway/mode".format = "<span style=\"italic\">{}</span>";
        "sway/scratchpad" = {
          format = "{icon} {count}";
          show-emtpy = false;
          format-icons = [
            ""
            ""
          ];
          tooltip = true;
          tooltip-format = "{app}: {title}";
        };
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
        };
        tray.spacing = 10;
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
        };
        cpu = {
          format = "{usage}% ";
          tooltip = false;
        };
        memory.format = "{}% ";
        temperature = {
          thermal-zone = 2;
          hwmon-path = "/sys/class/hwmon/hwmon0/temp1_input";
          critical-threshold = 80;
          format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };
        backlight = {
          device = "acpi_video1";
          format = "{percent}% {icon}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
            ""
          ];
        };
        battery = {
          states = {
            good = 95;
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-full = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time icon}";
          # format-good = "";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        power-profiles-daemon = {
          format = "{icon}";
          tooltip-format = "Power profile: {profile}\nDriver: {driver}";
          tootip = true;
          format-icons = {
            default = "";
            performance = "";
            balanced = "";
            power-saver = "";
          };
        };
        network = {
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "pavucontrol";
        };
        "custom/power" = {
          format = " ⏻ ";
          tooltip = false;
          menu = "on-click";
          menu-file = "$HOME/.config/waybar/power_menu.xml";
          menu-actions = {
            hibernate = "systemctl hibernate";
            logout = "${pkgs.sway}/bin/swaymsg exit";
            reboot = "reboot";
            shutdown = "shutdown";
            suspend = "systemctl suspend";
          };
        };
      };
    };
  };

  catppuccin.waybar.enable = false;

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    mako
  ];

  xdg.configFile."waybar/power_menu.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <interface>
      <object class="GtkMenu" id="menu">
        <child>
            <object class="GtkMenuItem" id="logout">
                <property name="label">Logout</property>
            </object>
        </child>
        <child>
            <object class="GtkMenuItem" id="suspend">
                <property name="label">Suspend</property>
            </object>
        </child>
        <child>
            <object class="GtkMenuItem" id="hibernate">
                <property name="label">Hibernate</property>
            </object>
        </child>
        <child>
          <object class="GtkSeparatorMenuItem" id="delimiter1"/>
        </child>
        <child>
            <object class="GtkMenuItem" id="reboot">
                <property name="label">Reboot</property>
            </object>
        </child>
        <child>
            <object class="GtkMenuItem" id="shutdown">
                <property name="label">Shutdown</property>
            </object>
        </child>
      </object>
    </interface>
  '';

}
