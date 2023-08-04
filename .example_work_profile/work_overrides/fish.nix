{ pkgs, lib, config, ... }: {
  programs.fish = {
    # Shell overrides for work

    shellAbbrs = rec {
      putmykey = "ssh-copy-id -i ~/.ssh/id_ed25519";
      putrootkey = "ssh-copy-id -i ~/.ssh/id_ed25519-root";
      ssh = "ssh -i ~/.ssh/id_ed25519 -l work-user";
      sshroot = "ssh -i ~/.ssh/id_ed25519-root -l root";
      vpnkit = "wsl.exe -d wsl-vpnkit --cd /app service wsl-vpnkit";
    };
  };
}