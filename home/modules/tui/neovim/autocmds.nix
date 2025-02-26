{
  programs.nixvim.autoCmd = [
    # Vertically center document when entering insert mode
    {
      event = "InsertEnter";
      command = "norm zz";
    }

    # Open help in a vertical split
    {
      event = "FileType";
      pattern = "help";
      command = "wincmd L";
    }

    # Text file overrides
    {
      event = "FileType";
      pattern = [ "markdown" "text" ];
      command =
        "setlocal spell spelllang=en wrap linebreak ts=2 sw=2 sts=2 nolist";
    }

    # Gitlab CI
    {
      event = [ "BufRead" "BufNewFile" ];
      pattern = "*.gitlab-ci*.{yml,yaml}";
      callback = { __raw = "function() vim.bo.filetype = 'yaml.gitlab' end"; };
    }

  ];
}

