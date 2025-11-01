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
    astroterm
    awscli
    bsd-finger
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
    lazydocker
    mtr
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
