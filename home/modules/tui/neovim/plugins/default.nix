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
    colorschemes.cyberdream.enable = true;

    plugins = {
      web-devicons.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
          delete.text = "-";
        };
      };

      nvim-autopairs.enable = true;

      nvim-colorizer = {
        enable = true;
        userDefaultOptions.names = false;
      };

      trim = {
        enable = true;
        settings = {
          highlight = false;
          trim_last_line = false;
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

