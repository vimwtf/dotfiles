{
  programs.nixvim = {
    clipboard = {
      providers = {
        wl-copy.enable = true;
        xsel.enable = true;
      };
      register = "unnamedplus";
    };

    opts = {
      updatetime = 100; # Faster completion
      relativenumber = true; # Relative line numbers
      number = true; # Display absolute line number of current line
      hidden = true; # Keep closed buffer open in the background
      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the corrent one
      swapfile = false; # Disable the swap file
      modeline = true; # tags such as 'vim:ft=sh'
      modelines = 5; # check first and last five lines for modelines
      undofile = true; # save and restore undo history
      incsearch = true; # incremental search: show match for partly typed search command
      inccommand = "split"; # search and replace: preview changes in quickfix list
      ignorecase = true; # when search query is lowercase match both lower and upper patterns
      smartcase = true; # override ignorecase if search pattern containers upper case
      scrolloff = 8; # number of lines to show around the cursor
      cursorline = true; # highlight the screen line of the cursor
      cursorcolumn = false; # highlight the screen column of the cursor
      signcolumn = "yes"; # whether to show the signcolumn
      colorcolumn = "100"; # columns to highlight
      laststatus = 3; # when to use a status line for the last window
      fileencoding = "utf-8"; # file-content encoding for the current buffer
      termguicolors = true; # enables 24-bit colors
      spell = false; # highlight spelling mistakes
      wrap = false; # prevent wrapping text
      tabstop = 2; # number of spaces a <Tab> in the text stands for
      shiftwidth = 2; # number of spaces used for each step of (auto)indent
      expandtab = true; # expand <Tab> to spaces in Insert mode
      autoindent = true; # do clever autoindenting
      textwidth = 0; # maximum width of text that is being inserted, a longer line will be broken after whitespace to this width
      foldlevel = 99; # folds with a level higher than this number will be closed
    };
  };
}