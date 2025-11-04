{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    grim
    mako
    slurp
    sway
    wl-clipboard
  ];

  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  security.pam.services.swaylock = { };

  services.displayManager.gdm.enable = true;
  services.displayManager.sessionPackages = [ pkgs.sway ];
}
