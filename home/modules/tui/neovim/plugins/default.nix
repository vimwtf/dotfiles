{
  imports = [
    ./barbar.nix
    ./comment.nix
    ./floaterm.nix
    ./harpoon.nix
    ./lsp.nix
    ./md-preview.nix
    ./neo-tree.nix
    ./telescope.nix
    ./treesitter.nix
  ];

  programs.nixvim = {
    colorschemes.catppuccin.enable = true;

    plugins = {
      web-devicons.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      oil.enable = true;

      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lsipinfo"
            "neo-tree"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}