{
  services = {
    xrdp = {
      enable = true;
      defaultWindowManager = "/run/current-system/sw/bin/gnome-shell";
      openFirewall = true;
    };
  };
}
