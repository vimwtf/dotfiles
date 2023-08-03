{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
    ./features/desktop
    ./lib/chromeos.nix
  ];

  # packages
  home.packages = with pkgs; [
    libvirt
    vagrant
  ];
}
