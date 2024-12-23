{ pkgs, ... }: {
  programs.nixvim = {
    withNodeJs = true;
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
          cssls.enable = true;
          docker_compose_language_service.enable = true;
          dockerls.enable = true;
          eslint.enable = true;
          fish_lsp = {
            enable = true;
            package = "${pkgs.fish-lsp}";
          };
          gitlab_ci_ls = {
            enable = true;
            package = "${pkgs.gitlab-ci-ls}";
          };
          gopls.enable = true;
          html.enable = true;
          jsonls.enable = true;
          nixd.enable = true;
          pylsp.enable = true;
          terraformls.enable = true;
          yamlls.enable = true;
        };
      };
    };
  };
}
