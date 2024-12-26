{ config, inputs, ... }: {

  home.packages =
    [ (config.lib.nixGL.wrap inputs.ghostty.packages.x86_64-linux.default) ];

}

