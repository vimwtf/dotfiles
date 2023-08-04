{ pkgs, ... }: {
  imports = [
    ./fish.nix
  ];

  home = {
    # username override
    username = "work-user";
    packages = with pkgs; [
      packer
      terraform
      vagrant
      vault
      wsl-open
      wslu
    ];
  };

  programs = {
    htop.enable = true;

    git.userEmail = "work-user@company.tld";
  };
}