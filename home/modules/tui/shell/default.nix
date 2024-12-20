{
  imports = [ ./eza.nix ./fish ];

  home = { shellAliases = import ./aliases.nix; };

  programs = {
    zoxide = {
      enable = true;
      options = [ "--cmd" "j" ];
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fzf.enable = true;

    bat = {
      enable = true;
      config = { theme = "gruvbox-dark"; };
    };
  };
}
