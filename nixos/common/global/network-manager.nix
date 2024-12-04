{ lib, ... }: {
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
}