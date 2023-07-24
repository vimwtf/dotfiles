{ pkgs, lib, config, ... }: {
  imports = [
    ../../common/home.nix
    ../../lib/vscode.nix
  ];

  # packages
  home.packages = with pkgs; [
    obsidian
  ];
    
  # XDG settings
  xdg.enable = true;
  xdg.mime.enable = true;
}
