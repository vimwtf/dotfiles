{ config, isWork, pkgs, ... }: {
  # Extra CLI apps

  imports = [ ./go.nix ];

  sops.secrets.vault-address.sopsFile =
    if isWork then ./secrets-work.yaml else ./secrets-personal.yaml;

  home.packages = with pkgs; [
    android-tools
    astroterm
    awscli
    bsd-finger
    cosign
    dive
    envsubst
    fast-cli
    gh
    google-cloud-sdk
    gping
    hadolint
    httpie
    kompose
    kubectl
    nil
    nixfmt-classic
    opentofu
    powershell
    rclone
    sops
    ssh-to-age
    vault
    ytt
  ];

  programs.fish = {
    shellAbbrs = {
      astro = "astroterm --color --constellations --unicode";
      k = "kubectl";
      terraform = "tofu";
      tf = "tofu";
      tfyolo = "tofu apply -auto-approve";
    };

    shellInit = ''
      set -x VAULT_ADDR "$(cat ${config.sops.secrets.vault-address.path})"
    '';

  };
}
