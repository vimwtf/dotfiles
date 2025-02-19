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
    google-cloud-sdk
    gh
    hadolint
    kubectl
    nil
    nixfmt-classic
    opentofu
    pkgs.unstable.astroterm
    ssh-to-age
    sops
    vault
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
