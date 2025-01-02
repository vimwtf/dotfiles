{ pkgs, ... }: {
  imports = [
    ./barbar.nix
    ./comment.nix
    ./floaterm.nix
    ./gitsigns.nix
    ./harpoon.nix
    ./lsp.nix
    ./md-preview.nix
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

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      better-escape.enable = true;
    };

    extraPlugins = with pkgs.vimPlugins; [ salt-vim ];
  };
}

