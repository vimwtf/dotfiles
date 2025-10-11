{
  programs.nixvim.plugins.trim = {
    enable = true;
    settings = {
      highlight = true;
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
}
