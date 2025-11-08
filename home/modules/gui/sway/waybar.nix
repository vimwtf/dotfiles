{ pkgs, ... }:
{

  catppuccin.waybar = {
    enable = true;
    mode = "createLink";
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
          "pulseaudio"
          "network"
          "backlight"
          "power-profiles-daemon"
          "battery"
          "clock"
          "tray"
          "custom/power"
        ];
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
        tray.spacing = 5;
        clock = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format-alt = "{:%Y-%m-%d}";
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
          format-charging = "{capacity}% ";
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
          format-wifi = "{essid} {icon}";
          format-ethernet = "{ipaddr}/{cidr} 󰈀";
          tooltip-format = "{ifname} via {gwaddr} 󰲝";
          format-linked = "{ifname} (No IP) 󰱟";
          format-disconnected = "";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
        };
        pulseaudio = {
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
            headphone = "";
            headset = "";
            default = [
              ""
              ""
              ""
            ];
          };
          on-click = "${pkgs.pavucontrol}/bin/pavucontrol";
        };
        "custom/power" = {
          format = " ⏻ ";
          tooltip = false;
          menu = "on-click";
          menu-file = "$HOME/.config/waybar/power_menu.xml";
          menu-actions = {
            hibernate = "systemctl hibernate";
            logout = "${pkgs.sway}/bin/swaymsg exit";
            reboot = "systemctl reboot";
            shutdown = "systemctl poweroff";
            suspend = "systemctl suspend";
          };
        };
        workspaces.sort-by-number = true;
      };
    };
    style = ''
      @import url('./catppuccin.css');

      * {
        font-family: FreeSans;
        font-size: 13px;
        min-height: 0;
        padding-right: 2px;
        padding-left: 2px;
        padding-bottom: 0px;
      }

      #waybar {
        background: transparent;
        color: @text;
      }

      #workspaces {
        border-radius: 5px;
        margin: 5px;
        background-color: @surface0;
        margin-left: 2px;
      }

      #workspaces button {
        color: @lavender;
        border-radius: 5px;
        padding: 0.4rem;
      }

      #workspaces button.focused {
        color: @sky;
      }

      #workspaces button:hover {
        color: @sapphire;
        border-color: @sapphire;
        border-radius: 5px;
      }

      button {
        background: transparent;
      }

      #tray,
      #backlight,
      #clock,
      #power-profiles-daemon,
      #battery,
      #pulseaudio,
      #custom-power {
        background-color: @surface0;
        padding: 0.5rem 0.75rem;
        margin: 2px 0;
      }

      #clock {
        color: @blue;
        border-radius: 0;
      }

      #backlight {
        padding: 0.5rem 0.5rem;
      }

      #battery {
        color: @green;
      }

      #battery.charging {
        color: @green;
      }

      #battery.warning:not(.charging) {
        color: @red;
      }

      #backlight {
        color: @yellow;
      }

      #backlight,
      #battery {
        border-radius: 0;
      }

      #pulseaudio {
        color: @maroon;
        border-radius: 5px 0px 0px 5px;
      }

      #custom-power {
        margin-right: 2px;
        border-radius: 0px 5px 5px 0px;
        color: @red;
      }

      #workspaces button.urgent {
        color: @red;
      }
    '';
  };

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
