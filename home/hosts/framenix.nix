{ pkgs, ... }:
{
  imports = [
    ../global
    ../modules/tui/extras
    ../modules/gui
    ../modules/gui/sway
    ../modules/gui/chrome.nix
  ];

  # packages
  home.packages = with pkgs; [
    ente-cli
    tor-browser
  ];
}
