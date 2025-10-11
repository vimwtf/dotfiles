{
  programs.nixvim = {
    clipboard = {
      providers = {
        xsel.enable = true;
      };
      register = "unnamed";
    };

    opts = {
      autoindent = true; # do clever autoindenting
      colorcolumn = "100"; # columns to highlight
      cursorcolumn = false; # highlight the screen column of the cursor
      cursorline = true; # highlight the screen line of the cursor
      expandtab = true; # expand <Tab> to spaces in Insert mode
      fileencoding = "utf-8"; # file-content encoding for the current buffer
      foldlevel = 99; # folds with a level higher than this number will be closed
      hidden = true; # Keep closed buffer open in the background
      ignorecase = true; # when search query is lowercase match both lower and upper patterns
      inccommand = "split"; # search and replace: preview changes in quickfix list
      incsearch = true; # incremental search: show match for partly typed search command
      laststatus = 3; # when to use a status line for the last window
      list = true; # enable showing non-printing characters by default
      # how to display certain non-printing characters
      listchars = "eol:¬,tab:>·,trail:·,extends:>,precedes:<,space:·";
      modeline = true; # tags such as 'vim:ft=sh'
      modelines = 5; # check first and last five lines for modelines
      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection
      number = true; # Display absolute line number of current line
      relativenumber = true; # Relative line numbers
      scrolloff = 8; # number of lines to show around the cursor
      shiftwidth = 2; # number of spaces used for each step of (auto)indent
      signcolumn = "yes"; # whether to show the signcolumn
      smartcase = true; # override ignorecase if search pattern containers upper case
      spell = false; # highlight spelling mistakes
      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the corrent one
      swapfile = false; # Disable the swap file
      tabstop = 2; # number of spaces a <Tab> in the text stands for
      termguicolors = true; # enables 24-bit colors
      textwidth = 0; # maximum width of text that is being inserted, a longer line will be broken after whitespace to this width
      undofile = true; # save and restore undo history
      updatetime = 100; # Faster completion
      wrap = false; # prevent wrapping text
    };
  };
}
