{ config, isWork, pkgs, ... }: {
  # Extra CLI apps

  imports = [ ../default.nix ./go.nix ];

  sops.secrets.vault-address.sopsFile =
    if isWork then ./secrets-work.yaml else ./secrets-personal.yaml;

  home.packages = with pkgs; [
    android-tools # Android SDK
    awscli # AWS CLI
    dnscontrol # Control your DNS
    envsubst # Envvar substitution for Go
    google-cloud-sdk # GCP CLI
    gh # Github CLI
    kubectl # Container wrangler
    nil # Nix LSP
    nixfmt-classic # Nix formatter (old, stable one until the new one is stableish)
    vault # Hashicorp vault
  ];

  programs.fish = {
    shellAbbrs = { k = "kubectl"; };

    shellInit = ''
      set -x VAULT_ADDR "$(cat ${config.sops.secrets.vault-address.path})"
    '';

    functions = { nugo = "hugo new content/posts/$argv/index.md"; };
  };
}
