{ lib, ... }: {
  programs.git = {
    enable = lib.mkDefault true;
    delta.enable = true;
    aliases = {
      graph = "log --decorate --oneline --graph";
      fast-forward = "merge --ff-only";
    };
    userEmail = lib.mkDefault "john@bowdre.net";
    userName = lib.mkDefault "John Bowdre";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };
}