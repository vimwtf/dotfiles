# Config files

## Nix
I've started the process of leveraging [Nix](https://nixos.org/explore.html) to manage my system configurations. This repo holds files used for managing user environments with [Home Manager](https://github.com/nix-community/home-manager). The goods are in [flake.nix](./flake.nix).

I've also set this up so that I can overlay a flake stored in a private repo, say for work-specific configurations. That will allow me to use the same base configs for both work and personal machines, but with some additional work-specific stuff on top. There's an example of how I did that in [.example_work_profile](./.example_work_profile).

