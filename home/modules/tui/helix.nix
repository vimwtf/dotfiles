{ pkgs, ... }:
{

  programs.helix = {
    defaultEditor = true;
    enable = true;
    extraPackages = with pkgs; [
      bash-language-server
      docker-compose-language-service
      dockerfile-language-server
      fish-lsp
      gitlab-ci-ls
      gopls
      markdown-oxide
      nil
      nixd
      nixpkgs-fmt
      shellcheck
      terraform-ls
      typescript-language-server
      vscode-langservers-extracted
      yaml-language-server
    ];
    languages = {
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
        }
        {
          name = "markdown";
          language-servers = [ "markdown-oxide" ];
          soft-wrap = {
            enable = true;
          };
        }
      ];
    };
    settings = {
      editor = {
        auto-save = {
          focus-lost = true;
          after-delay.enable = true;
        };
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        cursorline = true;
        end-of-line-diagnostics = "hint";
        file-picker = {
          hidden = false;
        };
        indent-guides = {
          render = true;
          character = "╎";
          skip-levels = 1;
        };
        inline-diagnostics = {
          other-lines = "error";
        };
        line-number = "relative";
        lsp.display-inlay-hints = true;
        popup-border = "all";
        trim-trailing-whitespace = true;
        whitespace = {
          render = "all";
          characters = {
            newline = "¬";
            space = "·";
            nbsp = "⍽";
            nnbsp = "␣";
            tab = ">";
            tabpad = "·";
          };
        };
      };
      theme = "catppuccin-mocha";
    };
  };
}
