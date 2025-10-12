{ pkgs, ... }:
{
  imports = [
    ./abbrs.nix
    ./functions.nix
    ./shell-init.nix
  ];

  programs = {
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
      settings = {
        nix_shell = {
          format = "via [$symbol]($style) ";
        };
      };
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
  };
}
