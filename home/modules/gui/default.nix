{ pkgs, ... }: {
  # Common GUI apps
  imports = [ ./firefox.nix ./kitty.nix ./vscode.nix ];

  home.packages = with pkgs; [ gimp-with-plugins qFlipper remmina ];
}
