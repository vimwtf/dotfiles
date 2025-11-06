{ pkgs, ... }:
{

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock";
      }
    ];
    timeouts = [
      {
        timeout = 585;
        command = "${pkgs.libnotify}/bin/notify-send 'Locking in 15 seconds...' -t 15000";
      }
      {
        timeout = 600;
        command = "${pkgs.swaylock}/bin/swaylock";
      }
      {
        timeout = 660;
        command = "${pkgs.sway}/bin/swaymsg \"output * power off\"";
        resumeCommand = "${pkgs.sway}/bin/swaymsg \"output * power on\"";
      }
    ];
  };
}
