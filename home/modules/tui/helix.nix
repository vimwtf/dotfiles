{ pkgs, ... }:
{

  programs.helix = {
    enable = true;
    extraPackages = with pkgs; [
      bash-language-server
      docker-compose-language-service
      dockerfile-language-server
      fish-lsp
      gitlab-ci-ls
      gopls
      nil
      nixd
      nixpkgs-fmt
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
      ];
    };
    settings = {
      editor = {
        auto-save = {
          focus-lost = true;
          after-delay.enable = true;
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        cursorline = true;
        file-picker = {
          hidden = false;
        };
        indent-guides = {
          render = true;
          character = "╎";
          skip-levels = 1;
        };
        line-number = "relative";
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
