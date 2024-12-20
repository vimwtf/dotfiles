{ pkgs, ... }: {
  # Common GUI apps
  imports = [ ./alacritty.nix ./firefox.nix ./vscode.nix ];

  home.packages = with pkgs; [ gimp-with-plugins qFlipper remmina ];
}
