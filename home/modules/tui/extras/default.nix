{ config, isWork, pkgs, ... }: {
  # Extra CLI apps

  imports = [ ./go.nix ];

  sops.secrets.vault-address.sopsFile =
    if isWork then ./secrets-work.yaml else ./secrets-personal.yaml;

  home.packages = with pkgs; [
    android-tools
    awscli
    cosign
    dive
    envsubst
    gh
    google-cloud-sdk
    hadolint
    kubectl
    nil
    nixfmt-classic
    opentofu
    pkgs.unstable.astroterm
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
