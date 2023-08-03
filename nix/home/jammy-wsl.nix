{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ./global
  ];

  home = {
    # username override
    username = "jbowdre";
    packages = with pkgs; [
      vagrant
      wslu
      wsl-open
    ];
  };
}
