{ config, inputs, ... }:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    policies =
      let
        mkLockedAttrs = builtins.mapAttrs (
          _: value: {
            Value = value;
            Status = "locked";
          }
        );

        mkPluginUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";

        mkExtensionEntry =
          {
            id,
            pinned ? false,
          }:
          let
            base = {
              install_url = mkPluginUrl id;
              installation_mode = "force_installed";
            };
          in
          if pinned then base // { default_area = "navbar"; } else base;

        mkExtensionSettings = builtins.mapAttrs (
          _: entry: if builtins.isAttrs entry then entry else mkExtensionEntry { id = entry; }
        );
      in
      {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableAppUpdate = true;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        ExtensionSettings = mkExtensionSettings {
          "uBlock0@raymondhill.net" = mkExtensionEntry {
            id = "ublock-origin";
            pinned = true;
          };
          "{446900e4-71c2-419f-a6a7-df9c091e268b}" = mkExtensionEntry {
            id = "bitwarden-password-manager";
            pinned = true;
          };
          "jid1-MnnxcxisBPnSXQ@jetpack" = mkExtensionEntry {
            id = "privacy-badger17";
            pinned = true;
          };
        };
        Preferences = mkLockedAttrs {
          "browser.aboutConfig.showWarning" = false;
          "browser.tabs.warnOnClose" = false;
          "media.videocontrols.picture-in-picture.video-toggle.enabled" = true;
          # Disable swipe gestures (Browser:BackOrBackDuplicate, Browser:ForwardOrForwardDuplicate)
          "browser.gesture.swipe.left" = "";
          "browser.gesture.swipe.right" = "";
          "browser.tabs.hoverPreview.enabled" = true;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.topsites.contile.enabled" = false;

          "privacy.resistFingerprinting" = true;
          "privacy.firstparty.isolate" = true;
          "network.cookie.cookieBehavior" = 5;
          "dom.battery.enabled" = false;

          "gfx.webrender.all" = true;
          "network.http.http3.enabled" = true;
        };
      };

    profiles.default = rec {
      settings = {
        "zen.workspaces.continue-where-left-off" = false;
        "zen.workspaces.natural-scroll" = true;
        "zen.view.compact.hide-tabbar" = true;
        "zen.view.compact.hide-toolbar" = true;
        "zen.view.compact.animate-sidebar" = false;
        "zen.welcome-screen.seen" = true;
      };

      bookmarks = {
        force = true;
        settings = [
          {
            name = "My Stuff";
            toolbar = true;
            bookmarks = [
              {
                name = "runtimeterror";
                url = "https://runtimeterror.dev/";
              }
            ];
          }
        ];
      };

      pinsForce = true;
      pins = {
        "Fastmail" = {
          id = "1bafdce5-3b5d-4055-87f7-fac2bf7d268c";
          url = "https://app.fastmail.com/mail/Inbox/";
          position = 101;
          isEssential = true;
        };
        "Gmail" = {
          id = "5fe9fa50-e2f7-4945-9a5d-c44951e16550";
          url = "https://mail.google.com/mail/u/1/";
          position = 102;
          isEssential = true;
        };
        "FeedCity" = {
          id = "e4b6359a-aff3-45df-b199-fb3b1e62fe8b";
          url = "https://feed.city/";
          position = 103;
          isEssential = true;
        };
        "Phanpy" = {
          id = "3bbe2ad9-2bbf-4269-b745-335d0718f78d";
          url = "https://phanpy.social";
          position = 104;
          isEssential = true;
        };
      };

      containersForce = true;
      containers = {
        Homelab = {
          color = "red";
          icon = "circle";
          id = 2;
        };
      };

      search = {
        force = true;
        default = "Kagi";
        engines = {
          "Kagi" = {
            urls = [
              {
                template = "https://kagi.com/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "k" ];
          };
          "Home Manager Options" = {
            urls = [
              {
                template = "https://home-manager-options.extranix.com/";
                params = [
                  {
                    name = "release";
                    value = "master";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "hmo" ];
          };
          "Nix Packages" = {
            urls = [
              {
                template = "https://search.nixos.org/packages";
                params = [
                  {
                    name = "channel";
                    value = "unstable";
                  }
                  {
                    name = "query";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
            definedAliases = [ "pkg" ];
          };
          bing.metaData.hidden = true;
          google.metaData.hidden = true;
          perplexity.metaData.hidden = true;
        };
      };
    };
  };

  xdg.mimeApps =
    let
      associations = builtins.listToAttrs (
        map
          (name: {
            inherit name;
            value =
              let
                zen-browser = config.programs.zen-browser.package;
              in
              zen-browser.meta.desktopFileName;
          })
          [
            "application/x-extension-shtml"
            "application/x-extension-xhtml"
            "application/x-extension-html"
            "application/x-extension-xht"
            "application/x-extension-htm"
            "x-scheme-handler/unknown"
            "x-scheme-handler/mailto"
            "x-scheme-handler/chrome"
            "x-scheme-handler/about"
            "x-scheme-handler/https"
            "x-scheme-handler/http"
            "application/xhtml+xml"
            "application/json"
            "text/plain"
            "text/html"
          ]
      );
    in
    {
      associations.added = associations;
      defaultApplications = associations;
    };
}
