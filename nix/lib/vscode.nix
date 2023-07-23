{ pkgs, lib, ...}: {
  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    enableUpdateCheck = false;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      eamodio.gitlens
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
    userSettings = {
      "diffEditor.ignoreTrimWhitespace" = false;
      "editor.acceptSuggestionOnCommitCharacter" = false;
      "editor.acceptSuggestionOnEnter" = "off";
      "editor.lineNumbers" = "relative";
      "editor.renderControlCharacters" = true;
      "editor.renderWhitespace" = "boundary";
      "editor.tabCompletion" = "off";
      "editor.tabSize" = 2;
      "explorer.confirmDragAndDrop" = false;
      "files.hotExit" = "onExitAndWindowClose";
      "git.confirmSync" = false;
      "git.ignoreLegacyWarning" = true;
      "powershell.codeFormatting.useCorrectCasing" = true;
      "security.workspace.trust.untrustedFiles" = "open";
      "vim.statusBarColorControl" = true;
      "vim.useCtrlKeys" = false;
      "window.restoreWindows" = "all";
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

  services.gnome-keyring.enable = true;
}

