{ config, ... }: {
  programs.fish.functions = {
    # cht.sh integration
    cht = "curl cheat.sh/$argv";
    # Disable greeting
    fish_greeting = "";

    get-local-ip =
      "ip addr show $(ip route | grep default | awk '{print $5}') | grep 'inet ' | awk '{print $2}' | cut -d/ -f1";

    ssh = "TERM=xterm command ssh $argv";
    # Rebuild home-manager
    switch-home =
      "home-manager switch -b backup --flake ${config.home.homeDirectory}/.dotfiles#$USER@$(hostname -s)";
    switch-nix =
      "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/.dotfiles";
    upgrade-nix =
      "nix-channel --update; nix-env --install --attr nixpkgs.nix nixpkgs.cacert";

    # Trees
    tt = ''
      cbonsai -S -t 0.25 -c "&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,🌸,🌺,💮"'';
  };
}
