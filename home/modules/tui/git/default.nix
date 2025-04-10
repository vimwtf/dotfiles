{ config, isWork, lib, pkgs, ... }: {

  sops.secrets.git-config.sopsFile =
    if isWork then ./secrets-work.yaml else ./secrets-personal.yaml;

  home.packages = lib.mkIf isWork [ pkgs.git-credential-manager ];

  programs.git = {
    enable = lib.mkDefault true;
    delta.enable = true;
    aliases = {
      graph = "log --decorate --oneline --graph";
      fast-forward = "merge --ff-only";
    };
    extraConfig = lib.mkMerge [
      {
        gpg.format = "ssh";
        init.defaultBranch = "main";
        pull.rebase = false;
        push.autoSetupRemote = true;
        user.signingKey = "~/.ssh/id_ed25519.pub";
      }
      (lib.mkIf isWork { credential.credentialStore = "gpg"; })
    ];
    includes = [{ path = "${config.sops.secrets.git-config.path}"; }];
  };

  programs.fish = lib.mkMerge [
    {
      shellAbbrs = {
        cleanup-branches = "git branch | grep -v main | xargs git branch -d";
      };
    }
    (lib.mkIf isWork {
      shellInit = ''
        set -x GPG_TTY "$(tty)"
      '';
    })
  ];
}
