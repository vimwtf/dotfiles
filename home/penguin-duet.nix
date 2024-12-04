{ pkgs, lib, config, ... }: {
  imports = [
    ./global
    ./features/cli/extras
    ./features/desktop/vscode.nix
    ./lib/chromeos.nix
  ];

  # packages
  home.packages = with pkgs; [
  ];
}
