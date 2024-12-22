{ pkgs, ... }: {
  # Common GUI apps
  imports = [ ./firefox.nix ./kitty.nix ];

  home.packages = with pkgs; [ gimp-with-plugins qFlipper remmina ];
}
