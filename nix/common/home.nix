{ pkgs, lib, config, ... }: {
  imports = [
    ../lib/tmux.nix
    ../lib/vim.nix
  ];
  # home-manager config
  home.username = "john";
  home.homeDirectory = "/home/john";
  home.stateVersion = "23.05"; # Please read the comment before changing.
  programs.home-manager.enable = true;
  targets.genericLinux.enable = true;

  # home files
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # env vars
  home.sessionVariables = {
    EDITOR = "vim";
  };

  # packages
  home.packages = with pkgs; [
    babelfish
    fish
    htop
    hugo
    libvirt
    packer
    powershell
    terraform
    tldr
    vagrant
    vault

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Fish shell settings
  programs.fish = {
    enable = true;
    shellInit = "source ${config.home.homeDirectory}/.nix-profile/etc/profile.d/nix.fish";
    functions = {
      switch-home = "home-manager switch -b backup --flake ${config.home.homeDirectory}/.dotfiles";
    };
  };

  # git settings
  programs.git = {
    enable = true;
    delta.enable = true;
    userEmail = "john@bowdre.net";
    userName = "John Bowdre";
    extraConfig = {
      init.defaultBranch = "main";
      pull.ff = "only";
    };
  };
}
