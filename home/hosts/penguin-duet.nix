{ ... }: {
  imports = [
    ../global
    ../modules/tui/extras
    ../modules/gui/vscode.nix
    ../lib/chromeos.nix
  ];

  # packages
  # home.packages = with pkgs; [ ];
}
