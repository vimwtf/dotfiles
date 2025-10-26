{ pkgs, ... }:
{

  programs.foot = {
    enable = true;
    package = with pkgs; foot;

    settings = {
      main = {
        font = "VictorMono Nerd Font Mono:size=11";
        initial-window-mode = "maximized";
        shell = "${pkgs.fish}/bin/fish";
        term = "xterm-256color";
      };
      bell = {
        system = "no";
        urgent = "no";
        notify = "no";
        visual = "yes";
      };
      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
