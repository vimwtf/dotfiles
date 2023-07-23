{
  description = "A Very Flakey Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, home-manager, ...}:
    let
      system = "x86_64-linux";
    in {
      defaultPackage.${system} = home-manager.defaultPackage.${system};

      homeConfigurations = {
        "john@penguin" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            system = "${system}";
            config.allowUnfree = true;
          };

          modules = [ ./nix/machines/penguin/home.nix ];
        };
      };
    };
  }
