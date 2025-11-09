{ pkgs, isNixOs, ... }:
{

  services.swayidle =
    let
      lock = if isNixOs then "${pkgs.swaylock}/bin/swaylock" else "/usr/bin/swaylock";
    in
    {
      enable = true;
      events = [
        {
          event = "before-sleep";
          command = lock;
        }
      ];
      timeouts = [
        {
          timeout = 585;
          command = "${pkgs.libnotify}/bin/notify-send 'Locking in 15 seconds...' -t 15000";
        }
        {
          timeout = 600;
          command = lock;
        }
        {
          timeout = 660;
          command = "${pkgs.sway}/bin/swaymsg \"output * power off\"";
          resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * power on\"";
        }
      ];
    };
}
