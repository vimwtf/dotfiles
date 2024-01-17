{ pkgs, ... }: {
  # Extra CLI apps

  imports = [
    ../default.nix
    ./direnv.nix
    ./go.nix
  ];

  home.packages = with pkgs; [
    android-tools # Android SDK
    awscli # AWS CLI
    envsubst # Envvar substitution for Go
    google-cloud-sdk # GCP CLI
    hugo # Static site generator
    kubectl # Container wrangler
    nil # Nix LSP
    nixfmt # Nix formatter
    packer # Hashicorp packer
    terraform # Hashicorp terraform
    trekscii # Cute startrek cli printer
    vault # Hashicorp vault
  ];
}