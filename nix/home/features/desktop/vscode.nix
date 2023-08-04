{ config, outputs, pkgs, lib, ... }: {

  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      github.copilot
      golang.go
      hashicorp.terraform
      ms-kubernetes-tools.vscode-kubernetes-tools
      ms-vscode-remote.remote-ssh
      ms-vscode.powershell
      redhat.vscode-yaml
      timonwong.shellcheck
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
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
    userSettings = {
      "diffEditor.ignoreTrimWhitespace" = false;
      "editor.acceptSuggestionOnCommitCharacter" = false;
      "editor.acceptSuggestionOnEnter" = "off";
      "editor.detectIndentation" = false;
      "editor.inlineSuggest.enabled" = true;
      "editor.lineNumbers" = "relative";
      "editor.renderControlCharacters" = true;
      "editor.renderWhitespace" = "all";
      "editor.tabCompletion" = "off";
      "editor.tabSize" = 2;
      "explorer.confirmDragAndDrop" = false;
      "files.hotExit" = "onExitAndWindowClose";
      "files.trimTrailingWhitespace" = true;
      "git.confirmSync" = false;
      "git.ignoreLegacyWarning" = true;
      "github.copilot.enable" = {
        "*" = true;
        "plaintext" = true;
        "markdown" = true;
        "scminput" = false;
        "yaml" = true;
      };
      "powershell.codeFormatting.useCorrectCasing" = true;
      "powershell.powerShellAdditionalExePaths" = {
        "pwsh" = "${config.home.homeDirectory}/.nix-profile/bin/pwsh";
      };
      "powershell.promptToUpdatePowerShell" = false;
      "security.workspace.trust.untrustedFiles" = "open";
      "vim.statusBarColorControl" = true;
      "vim.useCtrlKeys" = false;
      "window.restoreWindows" = "none";
      "workbench.startupEditor" = "none";
      "workbench.colorCustomizations" = {
        "statusBar.background" = "#005f5f";
        "statusBar.debuggingBackground" = "#005f5f";
        "statusBar.noFolderBackground" = "#005f5f";
      };
      "vim.normalModeKeyBindings" = [
        {
          "after" = ["@q"];
          "before" = ["Q"];
        }
      ];
    };
  };

}

