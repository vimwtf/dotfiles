{ pkgs, ... }:
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "VictorMono Nerd Font Mono:size=10";
        shell = "${pkgs.fish}/bin/fish";
      };
    };
  };
}
