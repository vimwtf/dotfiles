{ config, ... }: {
  programs.fish.functions = {
    # cht.sh integration
    cht = "curl cheat.sh/$argv";

    fish_greeting = "wx";

    get-local-ip =
      "ip addr show $(ip route | grep default | awk '{print $5}') | grep 'inet ' | awk '{print $2}' | cut -d/ -f1";

    ssh = "TERM=xterm command ssh $argv";

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

    wx = ''
      if test ! -f "${config.sops.secrets.tempest-station.path}"
        return 1
      end
      set -l station (cat ${config.sops.secrets.tempest-station.path})
      set -l token (cat ${config.sops.secrets.tempest-token.path})
      set -l cache_dir "$XDG_CACHE_HOME/fish"
      set -l cache_file "$cache_dir/wx"
      set -l cache_max_age 3600 # 1 hour in seconds

      # ensure cache_dir exists
      mkdir -p $cache_dir

      # use cached data if less than $cache_max_age old
      set -l current_time (date +%s)
      if test -f $cache_file
          set -l file_age (math $current_time - (stat -c %Z $cache_file))
          if test $file_age -lt $cache_max_age
              set -l wxdata (cat $cache_file | string split ',')
              wx_print $wxdata
              return 0
          end
      end

      # fetch fresh data
      set -l wxjson (curl --max-time 2 -sL --compressed \
          "https://swd.weatherflow.com/swd/rest/better_forecast?station_id=$station&token=$token&units_temp=f")

      if test $status -eq 0; and echo $wxjson | jq empty >/dev/null 2>&1
          set -l wxdata (echo $wxjson | jq -r '[
              (.current_conditions.conditions | ascii_downcase),
              (.current_conditions.air_temperature | round),
              (.forecast.daily[0].air_temp_low | round),
              (.forecast.daily[0].air_temp_high | round)
          ] | @csv' | tr -d '"' | string split ',')
          if test (count $wxdata -eq 4)
              string join ',' $wxdata >$cache_file
              wx_print $wxdata
          end
      end
    '';

    wx_print = ''
      set -l wxdata $argv
      if test (count $wxdata) -ne 4
          return 1
      end
      set_color -d white
      echo -ne "\nwx@home: "
      set_color green
      echo -n "$wxdata[1] and $wxdata[2]°f "
      set_color white
      echo -n "("
      set_color blue
      echo -n "$wxdata[3]°"
      set_color white
      echo -n "|"
      set_color red
      echo -n "$wxdata[4]°"
      set_color white
      echo ")"
      set_color normal
    '';

  };
}
