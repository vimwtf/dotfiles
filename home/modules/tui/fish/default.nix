{
  imports = [
    ./abbrs.nix
    ./aliases.nix
    ./functions.nix
    ./shell-init.nix
  ];

  programs.fish = {
    enable = true;
  };
}
