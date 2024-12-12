{
  programs.nixvim = {
    plugins = {
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      lsp = {
        enable = true;

        inlayHints = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };

        servers = {
          ansiblels.enable = true;
          # css_variables.enable = true;
          docker_compose_language_service.enable = true;
          dockerls.enable = true;
          eslint.enable = true;
          # fish_lsp.enable = true;
          # gitlab_ci_ls.enable = true;
          gopls.enable = true;
          html.enable = true;
          # jinja_lsp.enable = true;
          jsonls.enable = true;
          nixd.enable = true;
          # powershell_es.enable = true;
          pylsp.enable = true;
          # salt_ls.enable = true;
          terraformls.enable = true;
          yamlls.enable = true;
        };
      };
    };
  };
}
