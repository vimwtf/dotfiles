{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "<leader>n";
        action = ":Neotree reveal focus<CR>";
        options.desc = "Focus Neotree and reveal current file";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>N";
        action = ":Neotree close<CR>";
        options.desc = "Close Neotree";
        options.silent = true;
      }
    ];

    plugins.neo-tree = {
      enable = true;

      closeIfLastWindow = true;
      filesystem.filteredItems.forceVisibleInEmptyFolder = true;
      window = {
        width = 30;
        autoExpandWidth = false;
      };
    };
  };
}
