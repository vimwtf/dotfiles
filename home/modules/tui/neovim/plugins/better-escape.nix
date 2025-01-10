{ ... }: {
  programs.nixvim.plugins.better-escape = {
    enable = true;
    settings = {
      default_mappings = true;
      mappings = {
        c = {
          k = {
            j = "<Esc>";
            k = "<Esc>";
          };
        };
        i = {
          k = {
            j = "<Esc>";
            k = "<Esc>";
          };
        };
        s = {
          k = {
            j = "<Esc>";
            k = "<Esc>";
          };
        };
        t = {
          k = {
            j = "<Esc>";
            k = "<Esc>";
          };
        };
      };
    };
  };

}
