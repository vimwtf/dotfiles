{ pkgs, ... }: {
  imports = [ ./abbrs.nix ./functions.nix ./shell-init.nix ];

  programs = {
    atuin = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        enter_accept = true;
        inline_height = 20;
        style = "compact";
      };
    };

    fish = {
      enable = true;

      plugins = [
        {
          name = "plugin-git";
          src = pkgs.fishPlugins.plugin-git.src;
        }
        {
          name = "bass";
          src = pkgs.fishPlugins.bass.src;
        }
      ];
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      enableTransience = true;
      settings = { nix_shell = { format = "via [$symbol]($style) "; }; };
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}

