{ pkgs, ... }:
{
  imports = [
    ../global
    ../modules/gui
    ../modules/gui/sway
    ../modules/tui/extras
  ];

  wayland.windowManager.sway.config.startup = [
    {
      command = "/usr/bin/python3 /usr/libexec/reform-tools/reform-tray.py";
      always = true;
    }
  ];

  targets.genericLinux.gpu.enable = false;

  # extra packages
  # home.packages = with pkgs; [
  #   nerd-fonts.victor-mono
  # ];

}
