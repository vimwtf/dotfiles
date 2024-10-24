{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/extras
    ./features/desktop
    ./lib/chromeos.nix
  ];

  # packages
  # home.packages = with pkgs; [
  # ];
}
