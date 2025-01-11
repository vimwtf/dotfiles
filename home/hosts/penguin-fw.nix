{ pkgs, ... }: {
  imports = [ ../global ../modules/tui/extras ../modules/gui ];

  # extra packages
  home.packages = with pkgs;
    [
      dive # Explore docker images
    ];
}
