{ pkgs, ... }:
{
  imports = [
    ../global
    ../modules/gui
    ../modules/gui/sway
  ];

  # extra packages
  # home.packages = with pkgs; [
  #   nerd-fonts.victor-mono
  # ];

}
