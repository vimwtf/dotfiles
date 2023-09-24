{ pkgs, inputs, ... }: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-pc-ssd

    ./hardware-configuration.nix
    ./services

    ../common/global
    ../common/users/john

    ../common/optional/docker.nix
    ../common/optional/libvirtd.nix
    ../common/optional/sshd.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "pixnix";
    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";

  system.stateVersion = "23.05";

}
