{
  programs.fish.shellAbbrs = rec {
    ccat = "egrep -v '^\s*(#|\\$)'";
    dnsplan = "dnscontrol preview";
    dnspush = "dnscontrol push";
    g = "git";
    ga = "git add";
    gc = "git commit -S";      # interactive commit
    gcm = "git commit -S -m";  # quick commit
    gg = "git graph";
    gs = "git status";
    jqless = "jq -C | less -r";
    n = "nix";
    sshpass = "ssh -o PubkeyAuthentication=no";
    tf = "terraform";
    tfyolo = "terraform apply -auto-approve";
    v = "vim";
    vi = "vim";
  };
}