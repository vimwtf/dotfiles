{ pkgs, ... }:
{
  imports = [
    ../global
    ../modules/gui/rio.nix
  ];

  # extra packages
  home.packages = with pkgs; [
    ente-cli
    nerd-fonts.victor-mono
    tor-browser
  ];

  fonts.fontconfig.enable = true;
}
