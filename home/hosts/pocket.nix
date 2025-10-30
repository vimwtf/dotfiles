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

  programs.foot = {
    enable = true;
    package = with pkgs; foot;

    settings = {
      main = {
        font = "VictorMono Nerd Font Mono:size=11";
        shell = "${pkgs.fish}/bin/fish";
        dpi-aware = "no";
      };
    };
  };
}
