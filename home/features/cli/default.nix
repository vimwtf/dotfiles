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
    apg # Automatic password generator
    babelfish # Lets fish speak bash
    bottom # Prettier top
    dig # DNS lookup
    dos2unix # Convert DOS line endings to UNIX
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
    rsync # Remote sync
    tldr # TLDR pages
    unzip # unzip it
    yq # YAML pretty printer and manipulator
    zip # zip it
  ];
}
