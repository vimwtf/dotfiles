{ pkgs, ... }: {
  # Common CLI apps

  imports = [
    ./direnv.nix
    ./go.nix
    ./git.nix
    ./fish.nix
    ./tmux.nix
    ./vim.nix
  ];

  home.packages = with pkgs; [
    babelfish # Lets fish speak bash
    bottom # Better top
    httpie # Better curl
    hugo # Static site generator
    jq # JSON pretty printer and manipulator
    nil # Nix LSP
    # nix-inspect # See which pkgs are in your Path
    nixfmt # Nix formatter
    packer # Hashicorp packer
    powershell # Powershell
    terraform # Hashicorp terraform
    tldr # TLDR pages
    trekscii # Cute startrek cli printer
    vault # Hashicorp vault
  ];
}