{ pkgs, ... }:
{
  imports = [
    ../global
    ../modules/tui/extras
    ../modules/gui
    ../modules/gui/rio.nix
  ];

  # extra packages
  home.packages = with pkgs; [
    ente-cli
    tor-browser
  ];
}
