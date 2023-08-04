# Work profile overlay

_Inspired by [Published my Nix Dotfiles](https://www.chrisportela.com/posts/published-nix-dotfiles/)._

This repo demonstrates how I use a private repo to overlay my work-specific configurations on top of my personal ones. To use it, I just:
1. Clone the private repo to my machine.
2. `cd` into the private repo.
3. Run `home-manager switch --flake .#<username>@<hostname>` to activate the work profile (and then use the `switch-home` function to (re)activate it in the future).

When the public repo gets updated, I run `nix flake update` to pull in the changes before doing `switch-home` to reapply the config.