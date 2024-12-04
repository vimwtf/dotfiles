{ lib, ... }:
  let
    email = lib.concatStringsSep "" [ "john@bo" "wdre.net" ];
  in
  {
    programs.git = {
      enable = lib.mkDefault true;
      delta.enable = true;
      aliases = {
        graph = "log --decorate --oneline --graph";
        fast-forward = "merge --ff-only";
      };
      userEmail = lib.mkDefault email;
      userName = lib.mkDefault "John Bowdre";
      extraConfig = {
        gpg.format = "ssh";
        init.defaultBranch = "main";
        pull.rebase = false;
        user.signingKey = "~/.ssh/id_ed25519.pub";
      };
    };
  }