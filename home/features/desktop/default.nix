{ pkgs, ... }: {
  # Common GUI apps
  imports = [
    ./firefox.nix
    ./obsidian.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    qFlipper
  ];
}