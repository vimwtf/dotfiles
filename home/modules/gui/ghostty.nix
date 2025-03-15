{ config, pkgs, ... }: {

  home.packages = with pkgs.unstable; [ (config.lib.nixGL.wrap ghostty) ];

  xdg.configFile."ghostty/config".text = ''
    auto-update = off
    command = ${pkgs.fish}/bin/fish
    font-family = VictorMono NFM
    maximize = true
    shell-integration = fish
    theme = catppuccin-mocha
    title = " "
  '';
}

