{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/extras
  ];

  # packages
  home.packages = with pkgs; [

  ];
}
