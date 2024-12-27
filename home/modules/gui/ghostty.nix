{ config, inputs, pkgs, ... }: {

  home.packages =
    [ (config.lib.nixGL.wrap inputs.ghostty.packages.${pkgs.system}.default) ];

  xdg.configFile."ghostty/config".text = ''
    auto-update = off
    command = ${pkgs.fish}/bin/fish
    font-family = BerkeleyMono Nerd Font Mono
    shell-integration = fish
    theme = catppuccin-mocha
    title = " "
    window-height = 50
    window-width = 170
  '';
}

