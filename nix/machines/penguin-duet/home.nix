{ pkgs, lib, config, ... }: {
  imports = [
    ../../common/home.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # packages
  home.packages = with pkgs; [
    obsidian
  ];
    
  # XDG settings
  xdg.enable = true;
  xdg.mime.enable = true;
}
