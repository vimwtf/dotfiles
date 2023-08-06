{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
  ];

  # packages
  home.packages = with pkgs; [

  ];
}
