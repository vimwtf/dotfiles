{ config, pkgs, ... }: {

  programs.kitty = {
    enable = true;
    font.name = "BerkeleyMono Nerd Font Mono";
    package = (config.lib.nixGL.wrap pkgs.kitty);
    settings = {
      editor = "${pkgs.neovim}/bin/nvim";
      enable_audio_bell = "no";
      linux_display_server = "x11";
      paste_actions = "quote-urls-at-prompt,confirm,confirm-if-large";
      remember_window_size = "yes";
      resize_debounce_time = "0.5";
      shell = "${pkgs.fish}/bin/fish";
      strip_trailing_spaces = "smart";
      visual_bell_duration = "1.0 ease-in-out";
    };
    shellIntegration.enableFishIntegration = true;
  };
}

