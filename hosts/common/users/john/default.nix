{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.john = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "video"
      "audio"
    ] ++ ifTheyExist [
      "network"
      "wireshark"
      "mysql"
      "docker"
      "podman"
      "libvirtd"
      "networkmanager"
    ];

    packages = [ pkgs.home-manager ];
  };

  home-manager.users.john = import ../../../../home/${config.networking.hostName}.nix;

}