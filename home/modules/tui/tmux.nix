{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    customPaneNavigationAndResize = true;
    escapeTime = 50;
    focusEvents = true;
    historyLimit = 100000;
    keyMode = "vi";
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [
      gruvbox
    ];
    extraConfig = ''
      # new panes inherit current working directory
      bind '%' split-window -h -c '#{pane_current_path}'
      bind '"' split-window -v -c '#{pane_current_path}'

      # navigating panes with Ctrl+{hjkl}
      bind -n C-h select-pane -L
      bind -n C-j select-pane -D
      bind -n C-k select-pane -U
      bind -n C-l select-pane -R

      # synchronize panes with S
      bind S set-window-option synchronize-panes \; display-message 'Synchronize-panes #{?pane_synchronized,on,off}'

      # swap panes with <>
      bind > swap-pane -D
      bind < swap-pane -U

      # window operations
      unbind n
      unbind w
      bind n command-prompt "rename-window '%%'"
      bind w new-window
      bind -n M-j previous-window   # alt+j
      bind -n M-k next-window       # alt+k

      # shorter status update interval
      set-option -g status-interval 1

      # display up to 20 chars of session name
      set-option -g status-left-length 20

      # default statusbar colors
      set-option -g status-style fg=yellow,bg=black

      # default window title colors
      set-window-option -g window-status-style fg=brightblue,bg=default
      #set-window-option -g window-status-style dim

      # active window title colors
      set-window-option -g window-status-current-style fg=brightred,bg=default
      #set-window-options -g window-status-current-style bright

      # pane border
      set-option -g pane-border-style fg=black
      set-option -g pane-active-border-style fg=brightgreen

      # message text
      set-option -g message-style fg=brightred,bg=black

      # pane number display
      set-option -g display-panes-active-colour blue
      set-option -g display-panes-colour brightred

      # clock
      set-window-option -g clock-mode-colour brightgreen

      # bell
      set-window-option -g window-status-bell-style fg=black,bg=red

      # clipboard
      set-option -s set-clipboard on
    '';
  };

  home.shellAliases = {
    tm = "tmux";
    tms = "tmux new -s";
    tml = "tmux list-sessions";
    tma = "tmux attach -t";
    tmk = "tmux kill-session -t";
  };
}

