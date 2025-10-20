{ config, pkgs, ... }:
{

  programs.rio = {
    enable = true;
    package = with pkgs; (config.lib.nixGL.wrap rio);
    settings = {
      bell = {
        audio = false;
        visual = true;
      };
      cursor.blinking = true;
      fonts.family = "VictorMono Nerd Font Mono";
      shell.program = "${pkgs.fish}/bin/fish";
      window = {
        decorations = "Buttonless";
        mode = "Maximized";
      };
    };
  };
}
