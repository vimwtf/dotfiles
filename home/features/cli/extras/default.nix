{ pkgs, ... }: {
  # Extra CLI apps

  imports = [
    ../default.nix
    ./direnv.nix
    ./go.nix
  ];

  home.packages = with pkgs; [
    awscli # AWS CLI
    google-cloud-sdk # GCP CLI
    hugo # Static site generator
    kubectl # Container wrangler
    nil # Nix LSP
    # nix-inspect # See which pkgs are in your Path
    nixfmt # Nix formatter
    packer # Hashicorp packer
    terraform # Hashicorp terraform
    trekscii # Cute startrek cli printer
    vault # Hashicorp vault
  ];
}