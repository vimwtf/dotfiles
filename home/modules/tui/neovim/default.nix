{ inputs, pkgs, ... }:
{
  # neovim config largely lifted from https://github.com/GaetanLepage/nix-config/tree/master/home/modules/tui/neovim

  imports = [
    inputs.nixvim.homeModules.nixvim
    ./autocmds.nix
    ./completion.nix
    ./keymaps.nix
    ./options.nix
    ./plugins
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;

    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };

    viAlias = true;
    vimAlias = true;

    luaLoader.enable = true;
  };

  home.packages = with pkgs; [
    fd
    ripgrep
  ];
}
