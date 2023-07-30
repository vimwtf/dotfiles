{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/desktop
  ];

  # packages
  home.packages = with pkgs; [
    libvirt
    vagrant
  ];
}
