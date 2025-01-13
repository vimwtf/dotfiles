{ config, isWork, pkgs, ... }: {
  # Extra CLI apps

  imports = [ ./go.nix ];

  sops.secrets.vault-address.sopsFile =
    if isWork then ./secrets-work.yaml else ./secrets-personal.yaml;

  home.packages = with pkgs; [
    android-tools
    awscli
    dive
    dnscontrol
    envsubst
    google-cloud-sdk
    gh
    hadolint
    kubectl
    nil
    nixfmt-classic
    opentofu
    vault
  ];

  programs.fish = {
    shellAbbrs = {
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
