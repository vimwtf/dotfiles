{
  description = "A flake to overlay private configurations on my public flake";

  inputs = {
    dotfiles.url = "github:jbowdre/dotfiles";
  };

  outputs = { self, dotfiles, nixpkgs } @inputs:
  let
    inherit (dotfiles) homeConfigurations homeManagerModules inputs lib overlays packages;
    inherit (self) outputs;
  in
  {
    homeManagerModules = import "${dotfiles}/modules/home-manager";

    overlays = import "${dotfiles}/overlays" { inherit inputs outputs; };

    homeConfigurations = {
      "work-user@work-system" = lib.homeManagerConfiguration {
        modules = [
          "${dotfiles}/home/global"
          ./work_overrides
        ];
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
  };
}
