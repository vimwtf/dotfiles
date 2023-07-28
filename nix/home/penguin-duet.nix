{ pkgs, lib, config, ... }: {
  imports = [
    ./global
    ./lib/chromeos.nix
    ./features/desktop/vscode.nix
  ];

  # packages
  home.packages = with pkgs; [
    obsidian
  ];
}
