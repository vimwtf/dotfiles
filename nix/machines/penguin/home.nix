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
}
