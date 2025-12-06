{ pkgs, ... }:
{
  # Common GUI apps
  imports = [
    ./qutebrowser.nix
    ./zen-browser.nix
  ];

  home.packages = with pkgs; [
    annotator
    deltachat-desktop
    nerd-fonts.victor-mono
  ];

  fonts.fontconfig.enable = true;
}
