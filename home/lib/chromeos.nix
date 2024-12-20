{ pkgs, ... }:
let path = "config/systemd/user/cros-garcon.service.d/override.conf";
in {
  xdg.enable = true;
  xdg.mime.enable = true;

  xdg.configFile.${path} = {
    text = ''
      [Service]
      Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
      Environment="XDG_DATA_DIRS=/nix/var/nix/profiles/default/share:%h/.nix-profile/share:%h/.local/share:/usr/local/share:/usr/share:/var/lib/snapd/desktop:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"
    '';
  };
  home.packages = with pkgs; [ nixgl.nixGLMesa ];
}
