{ config, pkgs, ... }: {

  # home.packages = with pkgs; [ alacritty-theme ];

  programs.alacritty = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.alacritty);
    settings = {
      bell = {
        animation = "EaseOutCirc";
        duration = 200;
        color = "#c2985b";
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
      };
      font = { normal = { family = "BerkeleyMono Nerd Font Mono"; }; };
      general.import = [ pkgs.alacritty-theme.tokyo_night_enhanced ];
      terminal = { shell.program = "${pkgs.fish}/bin/fish"; };
      window = {
        decorations = "None";
        padding = {
          x = 3;
          y = 3;
        };
        startup_mode = "Maximized";
      };
    };
  };

}

