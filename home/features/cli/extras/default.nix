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
    kubectl # Container wrangler
    nil # Nix LSP
    nixfmt # Nix formatter
    trekscii # Cute startrek cli printer
    (unstable.vault) # Hashicorp vault from unstable
  ];

  programs.fish = {
    shellAbbrs = rec {
      k = "kubectl";
    };

    functions = {
      nugo = "hugo new content/posts/$argv/index.md";
    };
  };
}