{ config, ... }: {
  programs.fish.functions = {
    # cht.sh integration
    cht = "curl cheat.sh/$argv";

    # Display weather from tempest station
    fish_greeting = ''
      if test -f "${config.sops.secrets.tempest-station.path}"
        set station (cat ${config.sops.secrets.tempest-station.path})
        set token (cat ${config.sops.secrets.tempest-token.path})
        set wxjson (curl --max-time 2 --compressed -sL "https://swd.weatherflow.com/swd/rest/better_forecast?station_id=$station&token=$token&units_temp=f")
        if test $status -eq 0; and echo $wxjson | jq empty >/dev/null 2>&1
          set -l wxdata (echo $wxjson | jq -r '[
            (.current_conditions.conditions | ascii_downcase),
            (.current_conditions.air_temperature | round | tostring),
            (.forecast.daily[0].air_temp_low | round | tostring),
            (.forecast.daily[0].air_temp_high | round | tostring)
          ] | @tsv' | string split \t)
          echo -ne "\nwx@home: "; set_color -d green; echo -n "$wxdata[1] and $wxdata[2]°f "; set_color normal
          echo -n "("; set_color -d blue; echo -n "$wxdata[3]°"; set_color normal
          echo -n "|"; set_color -d red; echo -n "$wxdata[4]°"; set_color normal; echo ")"
        else
          return 1
        end
      end
    '';

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

    # tmux quickstart
    tmm =
      "tmux attach-session -t (hostname -s) || tmux new-session -s (hostname -s) -c $HOME";
  };
}
