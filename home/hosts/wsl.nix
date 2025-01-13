{ pkgs, ... }: {
  imports = [ ../global ../modules/tui/extras ];

  # extra packages
  home.packages = with pkgs; [ git-credential-manager wsl-open wslu ];
}
