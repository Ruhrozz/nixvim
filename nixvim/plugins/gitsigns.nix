{
  highlightOverride = {
    GitSignsStagedAdd.link = "GitSignsAdd";
    GitSignsStagedAddNr.link = "GitSignsAddNr";
    GitSignsStagedAddLn.link = "GitSignsAddLn";
    GitSignsStagedChange.link = "GitSignsChange";
    GitSignsStagedChangeNr.link = "GitSignsChangeNr";
    GitSignsStagedChangeLn.link = "GitSignsChangeLn";
    GitSignsStagedDelete.link = "GitSignsDelete";
    GitSignsStagedDeleteNr.link = "GitSignsDeleteNr";
    GitSignsStagedDeleteLn.link = "GitSignsDeleteLn";
    GitSignsStagedTopdelete.link = "GitSignsTopdelete";
    GitSignsStagedTopdeleteNr.link = "GitSignsTopdeleteNr";
    GitSignsStagedTopdeleteLn.link = "GitSignsTopdeleteLn";
    GitSignsStagedChangedelete.link = "GitSignsChangedelete";
    GitSignsStagedChangedeleteNr.link = "GitSignsChangedeleteNr";
    GitSignsStagedChangedeleteLn.link = "GitSignsChangedeleteLn";
  };

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
