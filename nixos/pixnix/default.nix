{ inputs, ... }:
{
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix

    ../common/global
    ../common/users/john

    ../common/optional/docker.nix
    ../common/optional/gnome.nix
    ../common/optional/libvirtd.nix
    ../common/optional/pipewire.nix
    ../common/optional/printing.nix
    ../common/optional/remote-desktop.nix
    ../common/optional/sshd.nix
  ];

  networking = {
    hostName = "pixnix";
    networkmanager.enable = true;
  };

  system.stateVersion = "23.05";

}
