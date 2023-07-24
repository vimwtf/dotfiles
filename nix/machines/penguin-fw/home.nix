{ pkgs, lib, config, ... }: {
  imports = [
    ../../common/home.nix
    ../../lib/vscode.nix
  ];

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
