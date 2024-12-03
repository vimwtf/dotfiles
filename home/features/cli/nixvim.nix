{ pkgs, lib, ... }: {

  imports = [
    <nixvim_import>
  ];

  programs.nixvim.enable = true;
}