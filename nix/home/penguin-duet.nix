{ pkgs, lib, config, ... }: {
  imports = [
    ./global
    ./lib/chromeos.nix
  ];

  # packages
  home.packages = with pkgs; [
    obsidian
  ];
}
