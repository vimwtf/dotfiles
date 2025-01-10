{ pkgs, ... }: {
  # Core CLI apps

  imports = [ ./git ./shell ./nix-index.nix ./neovim ./tmux.nix ];

  home.packages = with pkgs; [
    age # Simple, modern and secure file encryption tool
    apg # Automatic password generator
    cbonsai # Happy little trees
    dig # DNS lookup
    dos2unix # Convert DOS line endings to UNIX
    fast-cli # Netflix speed test
    fortune # Fortune cookies
    gping # Better ping
    httpie # Better curl
    mtr # Better traceroute
    nmap # Network scanner
    pass # Standard unix password manager
    pigz # Multithreaded gzip
    powershell # Powershell
    python3 # Python 3
    rsync # Remote sync
    ssh-to-age # Convert ssh keys to age
    sops # Atomic, declarative, and reproducible secret provisioning
    unzip # unzip it
    yq # YAML pretty printer and manipulator
    zip # zip it
  ];

  programs = {
    btop.enable = true; # prettier top
    home-manager.enable = true; # managerier home
    jq.enable = true; # json parser
  };
}
