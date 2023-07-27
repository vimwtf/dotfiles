{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../lib/tmux.nix
    ../lib/vim.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  home = {
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.05";

    file = {

    };

    packages = with pkgs; [
      babelfish
      hugo
      packer
      powershell
      terraform
      tldr
      vault
    ];

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = lib.mkDefault true;
      nix-direnv.enable = true;
    };

    fish = {
      enable = true;
      shellInit = "source ${config.home.homeDirectory}/.nix-profile/etc/profile.d/nix.fish";
      functions = {
        switch-home = "home-manager switch -b backup --flake ${config.home.homeDirectory}/.dotfiles#$USER@$(hostname -s)";
      };
    };

    git = {
      enable = lib.mkDefault true;
      delta.enable = true;
      userEmail = lib.mkDefault "john@bowdre.net";
      userName = lib.mkDefault "John Bowdre";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
      };
    };

    htop.enable = lib.mkDefault true;

    jq.enable = lib.mkDefault true;

  };

  targets.genericLinux.enable = true;
}
