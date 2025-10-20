{ pkgs, ... }:
{
  # Common GUI apps
  imports = [
    ./librewolf.nix
    ./rio.nix
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
