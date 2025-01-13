{ pkgs, ... }: {
  imports = [ ../global ../modules/tui/extras ];

  # extra packages
  home.packages = with pkgs;
    [
      wsl-open
      wslu
    ];
}
