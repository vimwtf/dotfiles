{ config, isWork, pkgs, ... }: {
  # Core CLI apps

  imports = [ ./git ./helix.nix ./shell ./nix-index.nix ./neovim ./tmux.nix ];

  sops.secrets.ssh-config.sopsFile =
    if isWork then ./secrets-work.yaml else ./secrets-personal.yaml;

  home.packages = with pkgs; [
    apg
    cbonsai
    dig
    dos2unix
    fortune
    gnupg1
    lsof
    mtr
    nmap
    pass
    pigz
    python3
    unzip
    util-linux
    yq
    zip
  ];

  programs = {
    btop.enable = true; # prettier top
    home-manager.enable = true; # managerier home
    jq.enable = true; # json parser
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks."*" = {
        forwardAgent = false;
        addKeysToAgent = "no";
        compression = false;
        serverAliveInterval = 0;
        serverAliveCountMax = 3;
        hashKnownHosts = false;
        userKnownHostsFile = "~/.ssh/known_hosts";
        controlMaster = "no";
        controlPath = "~/.ssh/master-%r@%n:%p";
        controlPersist = "no";
      };
      includes = [ "${config.sops.secrets.ssh-config.path}" ];
    };
  };
}
