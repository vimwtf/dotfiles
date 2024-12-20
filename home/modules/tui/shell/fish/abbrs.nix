{
  programs.fish.shellAbbrs = rec {
    "-" = "prevd";
    ":q" = "exit";
    dnsplan = "dnscontrol preview";
    dnspush = "dnscontrol push";
    ga = "git add";
    gc = "git commit -S";
    gcm = "git commit -S -m";
  };
}
