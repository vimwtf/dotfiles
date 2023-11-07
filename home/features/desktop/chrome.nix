{ pkgs, inputs, outputs, lib, ... }: {
  home.packages = with pkgs; [
    google-chrome-beta
  ];
}
