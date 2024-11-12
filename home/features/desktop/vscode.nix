{ config, outputs, pkgs, lib, ... }: {

  home.packages = with pkgs; [
    hadolint
  ];

  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    package = pkgs.vscode;
    extensions = with pkgs.vscode-extensions; [
      # extensions available as nix packages
      bbenoist.nix
      github.vscode-github-actions
      golang.go
      hashicorp.terraform
      ms-azuretools.vscode-docker
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-vscode-remote.remote-ssh
      ms-vscode.powershell
      redhat.vscode-yaml
      tailscale.vscode-tailscale
      tamasfe.even-better-toml
      timonwong.shellcheck
      vscodevim.vim
      yzhang.markdown-all-in-one
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # extensions from the vscode marketplace
      {
        name = "auto-align";
        publisher = "bladnman";
        version = "0.0.13";
        sha256 = "sha256-N5XMHW6UadKjE29p2vevtjgqLA4QysYu2xT3njmyHLk=";
      }
      {
        name = "gemini-improved";
        publisher = "printfn";
        version = "1.0.6";
        sha256 = "sha256-PqDBxCT+7wApSwESJRgEes4+sItIF7T3KsIlVaNj2Fg=";
      }
      {
        name = "hadolint";
        publisher = "exiasr";
        version = "1.1.2";
        sha256 = "sha256-6GO1f8SP4CE8yYl87/tm60FdGHqHsJA4c2B6UKVdpgM=";
      }
      {
        name = "hcl";
        publisher = "hashicorp";
        version = "0.3.2";
        sha256 = "sha256-cxF3knYY29PvT3rkRS8SGxMn9vzt56wwBXpk2PqO0mo=";
      }
      {
        name = "jinjahtml";
        publisher = "samuelcolvin";
        version = "0.20.0";
        sha256 = "sha256-wADL3AkLfT2N9io8h6XYgceKyltJCz5ZHZhB14ipqpM=";
      }
      {
        name = "markdown-table-prettify";
        publisher = "darkriszty";
        version = "3.6.0";
        sha256 = "sha256-FZTiNGSY+8xk3DJsTKQu4AHy1UFvg0gbrzPpjqRlECI=";
      }
      {
        name = "snippet";
        publisher = "vscode-snippet";
        version = "1.2.0";
        sha256 = "sha256-eka7JRzSN7VWkLu2kITb5mSYZHpw7Hx8mZboQsFhpms=";
      }
    ];
    globalSnippets = {
      "Insert datestamp" = {
        prefix = ["date"];
        body = ["\"\${CURRENT_YEAR}-\${CURRENT_MONTH}-\${CURRENT_DATE}\""];
        description = "Insert date";
      };
      "Insert timestamp" = {
        prefix = ["datetime"];
        body = ["\"\${CURRENT_YEAR}-\${CURRENT_MONTH}-\${CURRENT_DATE}T\${CURRENT_HOUR}:\${CURRENT_MINUTE}:\${CURRENT_SECOND}Z\""];
        description = "Insert date and time";
      };
      "Torchlight line number markup" = {
        prefix = ["torchlight"];
        body = ["torchlight! {\"lineNumbers\":true}"];
        description = "Enable Torchlight line numbers";
      };
    };
    keybindings = [
      {
        key = "backspace";
        command = "-markdown.extension.onBackspaceKey";
        when = "editorTextFocus && !editorHasMultipleSelections && !editorReadonly && !markdown.extension.editor.cursor.inFencedCodeBlock && !markdown.extension.editor.cursor.inMathEnv && !suggestWidgetVisible && vim.mode != 'CommandlineInProgress' && vim.mode != 'EasyMotionInputMode' && vim.mode != 'EasyMotionMode' && vim.mode != 'Normal' && vim.mode != 'Replace' && vim.mode != 'SearchInProgressMode' && vim.mode != 'SurroundInputMode' && vim.mode != 'Visual' && vim.mode != 'VisualBlock' && vim.mode != 'VisualLine' && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "ctrl+shift+alt+down";
        command = "-markdown.extension.onCopyLineDown";
        when = "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "ctrl+shift+alt+up";
        command = "-markdown.extension.onCopyLineUp";
        when = "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "ctrl+enter";
        command = "-markdown.extension.onCtrlEnterKey";
        when = "editorTextFocus && !editorHasMultipleSelections && !editorReadonly && !markdown.extension.editor.cursor.inFencedCodeBlock && !markdown.extension.editor.cursor.inMathEnv && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "enter";
        command = "-markdown.extension.onEnterKey";
        when = "editorTextFocus && !editorHasMultipleSelections && !editorReadonly && !markdown.extension.editor.cursor.inFencedCodeBlock && !markdown.extension.editor.cursor.inMathEnv && !suggestWidgetVisible && vim.mode != 'CommandlineInProgress' && vim.mode != 'EasyMotionInputMode' && vim.mode != 'EasyMotionMode' && vim.mode != 'Normal' && vim.mode != 'Replace' && vim.mode != 'SearchInProgressMode' && vim.mode != 'SurroundInputMode' && vim.mode != 'Visual' && vim.mode != 'VisualBlock' && vim.mode != 'VisualLine' && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "ctrl+]";
        command = "-markdown.extension.onIndentLines";
        when = "editorTextFocus && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "alt+down";
        command = "-markdown.extension.onMoveLineDown";
        when = "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "alt+up";
        command = "-markdown.extension.onMoveLineUp";
        when = "editorTextFocus && !editorReadonly && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "ctrl+[";
        command = "-markdown.extension.onOutdentLines";
        when = "editorTextFocus && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "shift+enter";
        command = "-markdown.extension.onShiftEnterKey";
        when = "editorTextFocus && !editorHasMultipleSelections && !editorReadonly && !markdown.extension.editor.cursor.inFencedCodeBlock && !markdown.extension.editor.cursor.inMathEnv && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "shift+tab";
        command = "-markdown.extension.onShiftTabKey";
        when = "editorTextFocus && markdown.extension.editor.cursor.inList && !editorHasMultipleSelections && !editorReadonly && !editorTabMovesFocus && !hasOtherSuggestions && !hasSnippetCompletions && !inSnippetMode && !markdown.extension.editor.cursor.inFencedCodeBlock && !markdown.extension.editor.cursor.inMathEnv && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
      {
        key = "tab";
        command = "-markdown.extension.onTabKey";
        when = "editorTextFocus && markdown.extension.editor.cursor.inList && !editorHasMultipleSelections && !editorReadonly && !editorTabMovesFocus && !hasOtherSuggestions && !hasSnippetCompletions && !inSnippetMode && !inlineSuggestionVisible && !markdown.extension.editor.cursor.inFencedCodeBlock && !markdown.extension.editor.cursor.inMathEnv && !suggestWidgetVisible && editorLangId =~ /^markdown$|^rmd$|^quarto$/";
      }
    ];
    languageSnippets = {
      jinja-yaml = {
        "Insert SLS header" = {
          isFileTemplate = true;
          prefix = ["sls"];
          body = [
            "# -*- coding: utf-8 -*-"
            "# vim: ft=yaml"
            "---"
            "\$0"
          ];
        };
      };
      jinja-html = {
        "Insert jinja header" = {
          isFileTemplate = true;
          prefix = ["jinja"];
          body = [
            "# -*- coding: utf-8 -*-"
            "# vim: ft=jinja"
            "\$0"
          ];
        };
      };
    };
    userSettings = {
      "autoalign.moveableItems" = [
        "="
        ":"
        "+="
        "-="
      ];
      "autoalign.nonMoveableItemsAdditional" = [
        "ks="
        "ds="
      ];
      "diffEditor.ignoreTrimWhitespace" = false;
      "editor.acceptSuggestionOnCommitCharacter" = false;
      "editor.acceptSuggestionOnEnter" = "off";
      "editor.detectIndentation" = false;
      "editor.fontFamily" = "'Berkeley Mono', 'Droid Sans Mono', 'monospace'";
      "editor.fontLigatures" = true;
      "editor.inlineSuggest.enabled" = true;
      "editor.lineNumbers" = "relative";
      "editor.quickSuggestions" = {
        "other" = true;
        "comments" = false;
        "strings" = true;
      };
      "editor.renderControlCharacters" = true;
      "editor.renderWhitespace" = "all";
      "editor.snippetSuggestions" = "top";
      "editor.tabCompletion" = "off";
      "editor.tabSize" = 2;
      "explorer.confirmDragAndDrop" = false;
      "extensions.autoCheckUpdates" = false;
      "files.hotExit" = "onExitAndWindowClose";
      "files.trimTrailingWhitespace" = true;
      "git.confirmSync" = false;
      "git.ignoreLegacyWarning" = true;
      "go.toolsManagement.autoUpdate" = true;
      "go.toolsManagement.checkForUpdates" = "local";
      "html.autoClosingTags" = false;
      "powershell.codeFormatting.useCorrectCasing" = true;
      "powershell.powerShellAdditionalExePaths" = {
        "pwsh" = "${config.home.homeDirectory}/.nix-profile/bin/pwsh";
      };
      "powershell.promptToUpdatePowerShell" = false;
      "security.workspace.trust.untrustedFiles" = "open";
      "update.mode" = "none";
      "vim.normalModeKeyBindings" = [
        {
          "after" = ["@q"];
          "before" = ["Q"];
        }
      ];
      "vim.statusBarColorControl" = false;
      "vim.useCtrlKeys" = false;
      "window.restoreWindows" = "none";
      "workbench.startupEditor" = "none";
      "yaml.customTags" = [
        "!reference sequence"
      ];
      "[markdown]" = {
        "editor.defaultFormatter" = "yzhang.markdown-all-in-one";
        "editor.quickSuggestions" = {
          "other" = true;
          "comments" = false;
          "strings" = true;
        };
      };
    };
  };
}

