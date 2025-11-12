{ pkgs, ... }:
{
  imports = [
    ../global
    ../modules/gui
    ../modules/gui/sway
  ];

  wayland.windowManager.sway.config.startup = [
    {
      command = "/usr/bin/python3 /usr/libexec/reform-tools/reform-tray.py";
      always = true;
    }
  ];

  # extra packages
  # home.packages = with pkgs; [
  #   nerd-fonts.victor-mono
  # ];

}
