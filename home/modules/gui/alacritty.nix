{ config, pkgs, ... }: {
  programs.alacritty = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.alacritty);
    settings = { window = { startup_mode = "Maximized"; }; };
  };
}

