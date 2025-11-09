{ pkgs, ... }:
{

  programs.dconf.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";
      };
    };
  };

  environment.systemPackages = with pkgs; [
    blueman
    brightnessctl
    grim
    mako
    networkmanagerapplet
    papirus-icon-theme
    pasystray
    pavucontrol
    slurp
    sway
    swaylock
    wl-clipboard
  ];

  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;
  security.pam.services.swaylock = { };

  services.displayManager.gdm.enable = true;
  services.displayManager.sessionPackages = [ pkgs.sway ];
}
