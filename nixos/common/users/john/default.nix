{ pkgs, config, ... }:
let
  ifTheyExist = groups:
    builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.users.john = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "audio" "video" "wheel" ] ++ ifTheyExist [
      "dialout"
      "docker"
      "libvirtd"
      "mysql"
      "network"
      "networkmanager"
      "podman"
      "wireshark"
    ];

    packages = [ pkgs.home-manager ];
  };

  home-manager.users.john =
    import ../../../../home/hosts/${config.networking.hostName}.nix;

}
