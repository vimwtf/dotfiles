{ pkgs, ... }: {
  # Common GUI apps
  imports = [
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    firefox-esr
    obsidian
    qFlipper
  ];
}