{ pkgs, ... }: {
  # Common GUI apps
  imports = [ ./librewolf.nix ./ghostty.nix ];

  home.packages = with pkgs; [
    nerd-fonts.victor-mono
    qFlipper
    remmina
    tor-browser
  ];

}
