{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
    };
    displayManager = {
      gdm = {
        enable = true;
      };
    };
    desktopManager = {
      gnome.enable = true;
    };
  };
}
