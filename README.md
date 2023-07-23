# Config files

## Nix
I've started the process of leveraging [Nix](https://nixos.org/explore.html) to manage my system configurations. This repo will (eventually?) hold files used for managing user environments with [Home Manager](https://github.com/nix-community/home-manager). The goods are in [flake.nix](./flake.nix) and the [nix](./nix/) directory.

It's very much a work-in-progress though so the legacy dotfile configs are below.
## Legacy stuff
Clone the repo:
```sh
git clone https://github.com/jbowdre/dotfiles.git ~/.dotfiles
```
Use `ln` to symlink the desired configs into your home directory:
```sh
ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/pwsh/Microsoft.PowerShell_profile.ps1 ~/.config/powershell/Microsoft.PowerShell_profile.ps1

```