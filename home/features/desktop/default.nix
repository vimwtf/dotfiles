{ pkgs, ... }: {
  # Common GUI apps
  imports = [
    ./firefox.nix
    ./vscode.nix
  ];

  home.packages = with pkgs; [
    gimp-with-plugins
    obsidian
    qFlipper
    remmina
  ];
}