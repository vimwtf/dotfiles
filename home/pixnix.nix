{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/extras
    ./features/desktop
    ./features/desktop/chrome.nix
  ];

  # packages
  home.packages = with pkgs; [
    vagrant
  ];
}
