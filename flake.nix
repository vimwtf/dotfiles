{
  description = "A Very Flakey Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-23_05.url = "github:nixos/nixpkgs/nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {nixpkgs, home-manager, ...} @inputs:
    let
      # Overlays enable you to customize the Nixpkgs attribute set
      overlays = [
        (self: super:
          let
            system = self.stdenv.system;
          in {
            pkgs_2305 = inputs.nixpkgs-23_05.legacyPackages.${system};
            pkgs_aarch64 = import nixpkgs {
              system = "aarch64-${builtins.head (builtins.match ".+-([[:lower:]]+)" system)}";
            };
            pkgs_x86_64 = nixpkgs.legacyPackages.${"x86_64-${builtins.head (builtins.match ".+-([[:lower:]]+)" system)}"};
          })
      ];

      # Systems supported
      allSystems = [
        "aarch64-linux"
        "x86_64-linux"
      ];

      importPkgs = (system: import nixpkgs {
        inherit overlays system; 
        config.allowUnfree = true;
        });

      # Helper to provide system-specific attributes
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        inherit system;
        pkgs = (importPkgs system);
      });

    in
    rec {
      inherit allSystems importPkgs forAllSystems home-manager;

      overlays = { };

      packages = forAllSystems
      ({ pkgs, system }: rec {
        home-penguin-fw = homeConfigurations."john@penguin-fw".activationPackage;
        home-penguin-duet = homeConfigurations."john@penguin-duet".activationPackage;
        home-pixnix = homeConfigurations."john@pixnix".activationPackage;
        all = pkgs.symlinkJoin {
          name = "all";
          paths = [
            home-penguin-fw
            home-penguin-duet
            home-pixnix
          ];
        };
        default = all;
        });
      
      homeConfigurations = {
        "john@penguin-fw" = home-manager.lib.homeManagerConfiguration {
          pkgs = importPkgs "x86_64-linux";

          modules = [
            ./nix/machines/penguin-fw/home.nix
          ];
        };
        "john@penguin-duet" = home-manager.lib.homeManagerConfiguration {
          pkgs = importPkgs "aarch64-linux";

          modules = [
            ./nix/machines/penguin-duet/home.nix
          ];
        };
        "john@pixnix" = home-manager.lib.homeManagerConfiguration {
          pkgs = importPkgs "x86_64-linux";

          modules = [
            ./nix/common/home.nix
          ];
        };
      };
    };
}
