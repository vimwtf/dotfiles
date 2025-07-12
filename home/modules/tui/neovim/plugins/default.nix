{ pkgs, ... }: {
  imports = [
    ./barbar.nix
    ./better-escape.nix
    ./comment.nix
    ./floaterm.nix
    ./gitsigns.nix
    ./harpoon.nix
    ./lsp.nix
    ./md-preview.nix
    ./mkdnflow.nix
    ./neo-tree.nix
    ./telescope.nix
    ./treesitter.nix
    ./trim.nix
  ];

  programs.nixvim = {
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        integrations = {
          barbar = true;
          gitsigns = true;
          neotree = true;
          telescope = true;
          treesitter = true;
        };
      };
    };

    plugins = {
      web-devicons.enable = true;
      nvim-autopairs.enable = true;
      colorizer = {
        enable = true;
        settings.user_default_options.names = false;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [ salt-vim ];
  };
}

