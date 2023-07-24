{ pkgs, lib, config, ... }: {
  imports = [
    ../../common/home.nix
    ../../lib/vscode.nix
  ];

  # packages
  home.packages = with pkgs; [
    firefox-esr
    obsidian
    qFlipper
  ];
    
  # XDG settings
  xdg.enable = true;
  xdg.mime.enable = true;
}
