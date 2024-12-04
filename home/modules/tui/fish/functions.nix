{ config, ... }: {
  programs.fish.functions = {
    # cht.sh integration
    cht = "curl cheat.sh/$argv";
    # Disable greeting
    fish_greeting = "";
    fish_prompt = ''
      set -l last_pipestatus $pipestatus
      set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
      set -l normal (set_color normal)
      set -q fish_color_status
      or set -g fish_color_status red

      # Color the prompt differently when we're root
      set -l color_cwd $fish_color_cwd
      set -l suffix '>'
      if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
          set color_cwd $fish_color_cwd_root
        end
        set suffix '#'
      end

      # Write pipestatus
      # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
      set -l bold_flag --bold
      set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
      if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
      end
      set __fish_prompt_status_generation $status_generation
      set -l status_color (set_color $fish_color_status)
      set -l statusb_color (set_color $bold_flag $fish_color_status)
      set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

      echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal " "$nix_shell_info $prompt_status $suffix " "
    '';
    fish_right_prompt = ''
      set -l normal (set_color normal)
      # vcs
      set -g __fish_git_prompt_showdirtystate 1
      set -g __fish_git_prompt_showuntrackedfiles 1
      set -g __fish_git_prompt_showstashstate 1
      set -g __fish_git_prompt_showupstream informative
      set -g __fish_git_prompt_showcolorhints 1
      set -g __fish_git_prompt_use_informative_chars 1
      string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL
      and set -g __fish_git_prompt_char_dirtystate \U1F4a9
      set -g __fish_git_prompt_char_untrackedfiles "?"
      set -l vcs (fish_vcs_prompt '(%s)' 2>/dev/null)

      # timestamp
      set -l d (set_color brgrey)(date "+%R")$normal

      # execution duration
      set -l duration "$cmd_duration$CMD_DURATION"
      if test $duration -gt 100
        set duration (math $duration / 1000)s
      else
        set duration
      end

      # virtual env
      set -q VIRTUAL_ENV_DISABLE_PROMPT
      or set -g VIRTUAL_ENV_DISABLE_PROMPT true
      set -q VIRTUAL_ENV
      and set -l venv (string replace -r '.*/' "" -- "$VIRTUAL_ENV")

      # nix-shell
      set -l nix (
        if test -n "$IN_NIX_SHELL"
          echo -n "[nix]"
        end
      )

      string join " " -- $duration $venv $nix $vcs $d
    '';
    get-local-ip = "ip addr show $(ip route | grep default | awk '{print $5}') | grep 'inet ' | awk '{print $2}' | cut -d/ -f1";

    ssh = "TERM=xterm command ssh $argv";
    # Rebuild home-manager
    switch-home = "home-manager switch -b backup --flake ${config.home.homeDirectory}/.dotfiles#$USER@$(hostname -s)";
    switch-nix = "sudo nixos-rebuild switch --flake ${config.home.homeDirectory}/.dotfiles";
    upgrade-nix = "nix-channel --update; nix-env --install --attr nixpkgs.nix nixpkgs.cacert";

    # Trees
    tt = "cbonsai -S -t 0.25 -c \"&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,&,🌸,🌺,💮\"";
  };
}