{ config, lib, inputs, ... }:
let inherit (lib) mkEnableOption mkIf;
in {
  options.chromeos = {
    enable = mkEnableOption "ChromeOS-specific configuration";
  };

  config = mkIf config.chromeos.enable {

    # make linux gui apps appear in chromeos launcher
    xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
      [Service]
      Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
      Environment="XDG_DATA_DIRS=/nix/var/nix/profiles/default/share:%h/.nix-profile/share:%h/.local/share:/usr/local/share:/usr/share:/var/lib/snapd/desktop:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share"
    '';

    # make linux gui title bars not quite so bright
    xdg.configFile."systemd/user/sommelier-x@0.service.d/override.conf".text =
      ''
        [Service]
        Environment="SOMMELIER_FRAME_COLOR=#313244"
      '';

    # activate NixGL wrapper for Crostini
    nixGL.packages = inputs.nixgl.packages;
    nixGL.defaultWrapper = "mesa";
    # to use:
    # programs.example.package = (config.lib.nixGL.wrap pkgs.example);
    # or:
    # home.packages = with pkgs; [ (config.libnixGL.wrap example); ];

    # disable starship's container indicator on crostini
    programs.starship.settings.container.disabled = true;
  };
}
