{
  plugins.gitsigns = {
    enable = true;
    settings = {
      signs = {
        add.text = "▎";
        change.text = "▎";
        delete.text = "▎";
        topdelete.text = "▎";
        changedelete.text = "▎";
      };
      signs_staged = {
        add = {
          text = "▌";
          hl = "GitSignsAdd";
        };
        change = {
          text = "▌";
          hl = "GitSignsChange";
        };
        delete = {
          text = "▌";
          hl = "GitSignsDelete";
        };
        topdelete = {
          text = "▌";
          hl = "GitSignsDelete";
        };
        changedelete = {
          text = "▌";
          hl = "GitSignsChange";
        };
      };
    };
  };
}
