{ pkgs, ... }: {
  # Common GUI apps
  imports = [ ./firefox.nix ./ghostty.nix ./kitty.nix ];

  home.packages = with pkgs; [ gimp-with-plugins qFlipper remmina ];
}
