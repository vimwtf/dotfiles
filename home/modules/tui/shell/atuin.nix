{
  config,
  isWork,
  lib,
  ...
}:
{

  sops.secrets.atuin-key.sopsFile = ./secrets.yaml;

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    settings = lib.mkMerge [
      {
        enter_accept = true;
        inline_height = 20;
        style = "compact";
        update_check = false;
      }
      (lib.mkIf (isWork == false) {
        auto_sync = true;
        key_path = config.sops.secrets.atuin-key.path;
        sync_address = "https://atuin.vim.wtf";
        sync_frequency = "1h";
      })
    ];
  };
}
