{ pkgs, ... }:
{
  imports = [
    ../global
    ../modules/tui/extras
    # ../modules/gui
    # ../modules/gui/chrome.nix
  ];

  # packages
  home.packages = with pkgs; [
    deltachat-desktop
    ente-cli
    nerd-fonts.victor-mono
    tor-browser
  ];

  fonts.fontconfig.enable = true;
}
