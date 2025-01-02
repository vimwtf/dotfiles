{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;

      nixvimInjections = true;

      settings = {
        highlight.enable = true;
        indent.enable = true;
        incremental_selection = {
          enable = true;
          keymaps.node_incremental = "v";
          keymaps.node_decremental = "V";
        };
      };
      folding = true;
    };

    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # set to false if you have an updatetime of ~100
        clearOnCursorMove = false;
      };
    };

    hmts.enable = true;
  };
}
