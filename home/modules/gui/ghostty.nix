{ config, inputs, pkgs, ... }: {

  home.packages =
    [ (config.lib.nixGL.wrap inputs.ghostty.packages.x86_64-linux.default) ];

  xdg.configFile."ghostty/config".text = ''
    auto-update = off
    command = ${pkgs.fish}/bin/fish
    font-family = BerkeleyMono Nerd Font Mono
    initial-command = ${pkgs.fish}/bin/fish -c "${pkgs.tmux}/bin/tmux attach-session -t (hostname -s) || tmux new-session -s (hostname -s) -c $HOME"
    shell-integration = fish
    theme = catppuccin-mocha
    window-height = 50
    window-width = 170
  '';
}

