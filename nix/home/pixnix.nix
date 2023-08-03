{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/cli/extras
    ./features/desktop
  ];

  # packages
  home.packages = with pkgs; [
    libvirt
    vagrant
  ];
}
