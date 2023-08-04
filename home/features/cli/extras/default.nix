{ pkgs, ... }: {
  # Extra CLI apps

  imports = [
    ../default.nix
    ./direnv.nix
    ./go.nix
  ];

  home.packages = with pkgs; [
    hugo # Static site generator
    nil # Nix LSP
    # nix-inspect # See which pkgs are in your Path
    nixfmt # Nix formatter
    packer # Hashicorp packer
    terraform # Hashicorp terraform
    trekscii # Cute startrek cli printer
    vault # Hashicorp vault
  ];
}