{ pkgs, ... }: {
  # Common GUI apps
  imports = [ ./firefox.nix ./ghostty.nix ];

  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "VictorMono" ]; })
    qFlipper
    remmina
    tor-browser
  ];

}
