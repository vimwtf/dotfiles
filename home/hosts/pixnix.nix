{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../global
    ../modules/tui/extras
    ../modules/gui
    ../modules/gui/chrome.nix
  ];

  # packages
  home.packages = with pkgs; [
    vagrant
  ];
}
