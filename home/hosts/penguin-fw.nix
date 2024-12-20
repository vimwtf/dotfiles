{ pkgs, ... }: {
  imports =
    [ ../global ../modules/tui/extras ../modules/gui ../lib/chromeos.nix ];

  # extra packages
  home.packages = with pkgs;
    [
      dive # Explore docker images
    ];
}
