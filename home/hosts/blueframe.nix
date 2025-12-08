{ pkgs, ... }:
{
  imports = [
    ../global
    ../modules/tui/extras
  ];

  # packages
  home.packages = with pkgs; [
    ente-cli
  ];
}
