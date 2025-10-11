{
  imports = [
    ./eza.nix
    ./fish
  ];

  home = {
    shellAliases = import ./aliases.nix;
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fzf.enable = true;

    bat = {
      enable = true;
    };
  };
}
