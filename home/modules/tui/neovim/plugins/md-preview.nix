{
  programs.nixvim = {
    plugins.markdown-preview = {
      enable = true;

      settings = {
        auto_close = 0;
        combine_preview = 1;
        echo_preview_url = 1;
        theme = "dark";
      };
    };

    files."after/ftplugin/markdown.lua".keymaps = [
      {
        mode = "n";
        key = "<leader>m";
        action = ":MarkdownPreview<cr>";
      }
      {
        mode = "n";
        key = "<leader>M";
        action = ":MarkdownPreviewStop<cr>";
      }
    ];
  };
}
