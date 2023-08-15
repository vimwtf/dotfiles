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
    bottom # Prettier top
    httpie # Better curl
    jq # JSON pretty printer and manipulator
    mtr # Better traceroute
    nmap # Network scanner
    powershell # Powershell
    python3 # Python 3
    tldr # TLDR pages
  ];
}