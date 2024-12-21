{ config, pkgs, ... }: {

  programs.kitty = {
    enable = true;
    # package = (config.lib.nixGL.wrap pkgs.kitty);
    # settings = { linux_display_server = "x11"; };
  };
}

