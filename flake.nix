{
  description = "A Very Flakey Home Manager";

  # Initial layout shamelessly stolen from:
  # - https://github.com/Misterio77/nix-starter-configs/
  # - https://github.com/Misterio77/nix-config/

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    # You can access packages and modules from different nixpkgs revs
    # at the same time. Here's a working example:
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Also see the 'unstable-packages' overlay at 'overlays/default.nix'.

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware
    hardware.url = "github:nixos/nixos-hardware";

    # Firefox add-ons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixvim
    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # NixGL
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Catppuccin theme
    catppuccin.url = "github:catppuccin/nix";

    # Sops encryption
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      lib = nixpkgs.lib // home-manager.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forEachSystem = f: lib.genAttrs systems (sys: f pkgsFor.${sys});
      pkgsFor = nixpkgs.legacyPackages;

      getHostModule = hostname:
        let
          hostPath = ./home/hosts + "/${hostname}.nix";
          genericPath = ./home/hosts/pixnix.nix;
        in if builtins.pathExists hostPath then hostPath else genericPath;

      mkHomeConfiguration =
        { system, hostname, isWork ? false, isChromebook ? false }:
        lib.homeManagerConfiguration {
          modules = [
            (getHostModule hostname)
            {
              chromeos.enable = isChromebook;
              _module.args = { inherit hostname isWork; };
            }
          ];
          pkgs = pkgsFor.${system};
          extraSpecialArgs = { inherit inputs outputs; };
        };
    in {
      inherit lib;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;

      overlays = import ./overlays { inherit inputs outputs; };

      packages = forEachSystem (pkgs: import ./pkgs { inherit pkgs; });
      devShells = forEachSystem
        (pkgs: { default = import ./shell.nix { inherit pkgs; }; });
      formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

      nixosConfigurations = {
        # Pixelbook converted to NixOS
        pixnix = lib.nixosSystem {
          modules = [ ./nixos/pixnix ];
          specialArgs = { inherit inputs outputs; };
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "john@penguin-duet" = mkHomeConfiguration {
          hostname = "penguin-duet";
          isChromebook = true;
          system = "aarch64-linux";
        };
        "john@penguin-fw" = mkHomeConfiguration {
          hostname = "penguin-fw";
          isChromebook = true;
          system = "x86_64-linux";
        };
        "john@pixnix" = mkHomeConfiguration {
          hostname = "pixnix";
          system = "x86_64-linux";
        };
        "john@volly" = mkHomeConfiguration {
          hostname = "volly";
          system = "x86_64-linux";
        };
        "john@immich" = mkHomeConfiguration {
          hostname = "immich";
          system = "x86_64-linux";
        };
        "john@doc" = mkHomeConfiguration {
          hostname = "doc";
          system = "x86_64-linux";
        };
        "john@wsl" = mkHomeConfiguration {
          hostname = "doc";
          isWork = true;
          system = "x86_64-linux";
        };
      };
    };
}
