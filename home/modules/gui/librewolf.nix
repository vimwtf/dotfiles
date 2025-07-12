{ ... }:

{
  programs.librewolf = {
    enable = true;
    settings = {
      "app.update.auto" = false;
      "browser.disableResetPrompt" = true;
      "browser.download.panel.shown" = true;
      "browser.download.useDownloadDir" = true;
      "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
      "browser.shell.checkDefaultBrowser" = false;
      "browser.shell.defaultBrowserCheckCount" = 1;
      "browser.startup.homepage" = "https://kagi.com/";
      "dom.security.https_only_mode" = true;
      "extensions.pocket.enabled" = false;
      "privacy.trackingprotection.enabled" = true;
      "privacy.resistFingerprinting.letterboxing" = true;
      "privacy.resistFingerprinting" = true;
      "signon.rememberSignons" = false;
    };
  };

  home = {
    sessionVariables = {
      # https://github.com/NixOS/nixpkgs/issues/238025
      TZ = "/etc/localtime";
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "librewolf.desktop" ];
    "text/xml" = [ "librewolf.desktop" ];
    "x-scheme-handler/http" = [ "librewolf.desktop" ];
    "x-scheme-handler/https" = [ "librewolf.desktop" ];
  };

  catppuccin.librewolf.profiles = { };
}
