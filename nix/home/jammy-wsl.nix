{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
  ];

  home = {
    # username override
    username = "jbowdre";
    packages = with pkgs; [
      packer
      terraform
      vagrant
      vault
      wsl-open
      wslu
    ];
  };
}
