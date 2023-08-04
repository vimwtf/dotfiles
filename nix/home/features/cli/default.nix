{ pkgs, ... }: {
  # Core CLI apps

  imports = [
    ./exa.nix
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./vim.nix
  ];

  home.packages = with pkgs; [
    babelfish # Lets fish speak bash
    bottom # Better top
    httpie # Better curl
    jq # JSON pretty printer and manipulator
    powershell # Powershell
    tldr # TLDR pages
  ];
}