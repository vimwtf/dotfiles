{ pkgs, ... }:
{
  # Common GUI apps
  imports = [
    ./librewolf.nix
    ./ghostty.nix
  ];

  home.packages = with pkgs; [
    deltachat-desktop
    nerd-fonts.victor-mono
    qFlipper
    remmina
    tor-browser
  ];

  fonts.fontconfig.enable = true;
}
