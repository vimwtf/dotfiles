{ pkgs, ... }: {
  # Core CLI apps

  imports = [
    ./git.nix
    ./shell
    ./nix-index.nix
    ./neovim
    ./tmux.nix
    ./vim.nix
  ];

  home.packages = with pkgs; [
    apg # Automatic password generator
    babelfish # Lets fish speak bash
    bat # Better cat
    btop # Prettier top
    cbonsai # Happy little trees
    dig # DNS lookup
    dos2unix # Convert DOS line endings to UNIX
    fast-cli # Netflix speed test
    fortune # Fortune cookies
    httpie # Better curl
    jq # JSON pretty printer and manipulator
    mtr # Better traceroute
    nmap # Network scanner
    nodejs # Node js
    nodePackages.npm # Node package manager
    pass # Standard unix password manager
    pigz # Multithreaded gzip
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
