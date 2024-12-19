{
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
    colorschemes.tokyonight.enable = true;

    plugins = {
      web-devicons.enable = true;

      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };
    };
  };
}

