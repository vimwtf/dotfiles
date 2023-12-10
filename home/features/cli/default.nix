{ pkgs, ... }: {
  # Core CLI apps

  imports = [
    ./eza.nix
    ./git.nix
    ./fish.nix
    ./nix-index.nix
    ./tmux.nix
    ./vim.nix
  ];

  home.packages = with pkgs; [
    babelfish # Lets fish speak bash
    bottom # Prettier top
    dig # DNS lookup
    gh # Github CLI
    httpie # Better curl
    jq # JSON pretty printer and manipulator
    mtr # Better traceroute
    nmap # Network scanner
    nodejs # Node js
    nodePackages.npm # Node package manager
    powershell # Powershell
    pssh # Parallel SSH
    python3 # Python 3
    tldr # TLDR pages
    unzip # zip-unzip it
  ];
}
