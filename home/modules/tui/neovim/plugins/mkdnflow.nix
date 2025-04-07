{
  programs.nixvim.plugins.mkdnflow = {
    enable = true;
    modules = {
      bib = false;
      buffers = true;
      conceal = false;
      cursor = true;
      folds = true;
      links = true;
      lists = true;
      maps = true;
      paths = true;
      tables = true;
      yaml = false;
    };
    tables = {
      autoExtendCols = true;
      autoExtendRows = true;
    };
  };
}
