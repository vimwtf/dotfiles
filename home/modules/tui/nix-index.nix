{ lib, config, ... }:
let
  inherit (lib) mkIf;
  hasPackage = pname:
    lib.any (p: p ? pname && p.name == pname) config.home.packages;
  hasFish = hasPackage "fish";
in {
  programs.nix-index = {
    enable = true;
    enableFishIntegration = mkIf hasFish true;
  };

  programs.command-not-found.enable = false;
}
