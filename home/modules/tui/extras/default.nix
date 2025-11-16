{
  config,
  isWork,
  pkgs,
  ...
}:
{
  # Extra CLI apps

  imports = [ ./go.nix ];

  sops.secrets.vault-address.sopsFile =
    if isWork then ./secrets-work.yaml else ./secrets-personal.yaml;

  home.packages = with pkgs; [
    android-tools
    angle-grinder
    awscli
    bsd-finger
    copacetic
    dive
    docker-slim
    envsubst
    gh
    google-cloud-sdk
    httpie
    k0sctl
    kompose
    kubectl
    lazydocker
    nil
    nixfmt
    opentofu
    pigz
    powershell
    python3
    rclone
    sops
    ssh-to-age
    stable.cosign
    vault
    ytt
  ];

  programs = {
    yazi.enable = true;
    fish = {
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
  };
}
