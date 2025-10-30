{ pkgs, ... }:
{
  imports = [
    ../global
  ];

  # extra packages
  home.packages = with pkgs; [
    nerd-fonts.victor-mono
  ];

  fonts.fontconfig.enable = true;
}
