{ pkgs, lib, config, ... }: {
  imports = [
    ../../common/home.nix
    ../../lib/vscode.nix
  ];

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = (_: true);
  };

  # packages
  home.packages = with pkgs; [
    firefox-esr
    libvirt
    obsidian
    qFlipper
    vagrant
  ];
    
  # XDG settings
  xdg.enable = true;
  xdg.mime.enable = true;
}
