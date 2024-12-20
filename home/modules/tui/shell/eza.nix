{
  programs.eza = {
    enable = true;
    enableFishIntegration = false;
    extraOptions = [ "--group-directories-first" ];
    git = true;
  };

  home.shellAliases = {
    ls = "eza";
    l = "eza -lhg";
    ll = "eza -alhg";
    lt = "eza --tree";
  };
}
