{ inputs, outputs, lib, config, pkgs, ... }: {
  imports = [
    ../features/cli
  ] ++ (builtins.attrValues outputs.homeManagerModules);

  nixpkgs = {
    overlays = builtins.attrValues outputs.overlays;
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  nix = {
    package = lib.mkDefault pkgs.nix;
    settings = {
      experimental-features = ["nix-command" "flakes" ];
      warn-dirty = false;
    };
  };

  home = {
    username = lib.mkDefault "john";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
    stateVersion = lib.mkDefault "23.05";

    sessionVariables = {
      EDITOR = "vim";
    };
  };

  programs = {
    home-manager.enable = true;

  };

  targets.genericLinux.enable = true;
}
