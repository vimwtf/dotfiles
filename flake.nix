{
  description = "A Very Flakey Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        "aarch64-linux"
        "x86_64-linux"
      ];
    in
    rec {
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
       in import ./nix/pkgs { inherit pkgs; }
      );
      
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./nix/shell.nix { inherit pkgs; }
      );
        
      overlays = import ./nix/overlays { inherit inputs; };
      nixosModules = import ./nix/modules/nixos;
      homeManagerModules = import ./nix/modules/home-manager;

      nixosConfigurations = {
        pixnix = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./nix/nixos/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        "john@penguin-fw" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./nix/home/penguin-fw.nix
            {
              home = {
                username = "john";
                homeDirectory = "/home/john";
              };
            }
          ];
        };
      };
    };
}