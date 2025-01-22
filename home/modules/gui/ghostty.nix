{ config, pkgs, ... }: {

  home.packages = with pkgs.unstable; [ (config.lib.nixGL.wrap ghostty) ];

  xdg.configFile."ghostty/config".text = ''
    auto-update = off
    command = ${pkgs.fish}/bin/fish
    font-family = VictorMono NFM
    shell-integration = fish
    theme = catppuccin-mocha
    title = " "
    window-height = 50
    window-width = 170
  '';
}

