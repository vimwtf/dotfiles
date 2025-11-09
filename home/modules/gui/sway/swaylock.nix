{ ... }:
{
  programs.swaylock = {
    enable = true;
    package = null;
    settings = {
      ignore-empty-password = true;
      show-failed-attempts = true;
    };
  };
}
