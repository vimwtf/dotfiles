{ config, isWork, lib, ... }: {

  sops.secrets.git-email = {
    sopsFile = if isWork then ./secrets-work.yaml else ./secrets-personal.yaml;
  };

  programs.git = {
    enable = lib.mkDefault true;
    delta.enable = true;
    aliases = {
      graph = "log --decorate --oneline --graph";
      fast-forward = "merge --ff-only";
    };
    userName = lib.mkDefault "John Bowdre";
    extraConfig = {
      gpg.format = "ssh";
      init.defaultBranch = "main";
      pull.rebase = false;
      user.signingKey = "~/.ssh/id_ed25519.pub";
    };
  };

  programs.fish.shellInit = ''
    set -x GIT_COMMITTER_EMAIL "$(cat ${config.sops.secrets.git-email.path})"
  '';

}
