{ config, lib, ... }: {
  programs.nixvim = {
    globals = {
      mapleader = ",";
      maplocalleader = ",";
    };

    keymaps = let
      normal = lib.mapAttrsToList (key: action: {
        mode = "n";
        inherit action key;
      }) {
        "," = "<NOP>";

        # Esc to clear search results
        "<esc>" = ":noh<CR>";

        # fix Y behavior
        Y = "y$";

        # toggle between two most recent files
        "<C-c>" = ":b#<CR>";

        # close by Ctrl+x
        "<C-x>" = ":close<CR>";

        # save by Space+s or Ctrl+s
        "<leader>s" = ":w<CR>";
        "<C-s>" = ":w<CR>";

        # H, L to jump to start/end of line
        L = "$";
        H = "^";

        # resize with arrows
        "<C-Up>" = ":resize -2<CR>";
        "<C-Down>" = ":resize +2<CR>";
        "<C-Left>" = ":vertical resize +2<CR>";
        "<C-Right>" = ":vertical resize -2<CR>";

        # move current line up/down
        # M = Alt
        "<M-k>" = ":move-2<CR>";
        "<M-j>" = ":move+<CR>";

        # toggle display of non-printing characters
        "<leader>w" = ":set list!<CR>";
      };
      visual = lib.mapAttrsToList (key: action: {
        mode = "v";
        inherit action key;
      }) {
        # better indenting
        ">" = ">gv";
        "<" = "<gv";
        "<TAB>" = ">gv";
        "<S-TAB>" = "<gv";

        # move selected line/block in visual mode
        "K" = ":m '<-2<CR>gv=gv";
        "J" = ":m '>+1<CR>gv=gv";

        # sort
        "<leader>s" = ":sort<CR>";
      };
      insert = lib.mapAttrsToList (key: action: {
        mode = "i";
        inherit action key;
      }) {
        # Save by Ctrl+s
        "<C-s>" = "<Esc>:w<CR>";
      };
    in config.lib.nixvim.keymaps.mkKeymaps { options.silent = true; }
    (normal ++ visual ++ insert);
  };
}

