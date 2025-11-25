{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    quickmarks = {
      rterror = "https://runtimeterror.dev/";
    };
    searchEngines = {
      DEFAULT = "https://grep.vim.wtf/search?q={}";
    };
    settings = {
      content.autoplay = false;
    };

  };
}
