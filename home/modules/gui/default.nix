{ pkgs, ... }:
{
  # Common GUI apps
  imports = [
    ./zen-browser.nix
  ];

  home.packages = with pkgs; [
    deltachat-desktop
    nerd-fonts.victor-mono
  ];

  fonts.fontconfig.enable = true;
}
