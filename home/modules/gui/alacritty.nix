{ config, pkgs, ... }: {

  # home.packages = with pkgs; [ alacritty-theme ];

  programs.alacritty = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.alacritty);
    settings = {
      font = {
        normal = {
          family = "BerkeleyMono Nerd Font Mono";
          style = "Bold Italic";
        };
      };
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

