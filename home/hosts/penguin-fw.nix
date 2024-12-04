{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../global
    ../features/cli/extras
    ../features/desktop
    ../lib/chromeos.nix
  ];

  # extra packages
  home.packages = with pkgs; [
    dive # Explore docker images
  ];
}
