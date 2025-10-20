{ config, pkgs, ... }:
{

  programs.rio = {
    enable = true;
    package = with pkgs; (config.lib.nixGL.wrap rio);
    settings = {
      fonts.family = "VictorMono Nerd Font Mono";
      shell.program = "${pkgs.fish}/bin/fish";
      window.mode = "Maximized";
    };
  };
}
