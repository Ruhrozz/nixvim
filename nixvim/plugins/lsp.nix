{
  plugins.lsp = {
    enable = true;
    servers = {
      pyright = {
        enable = true;
        autostart = true;
      }; # python

      nil_ls = {
        enable = true;
        autostart = true;
        settings.formatting.command =
          [ "nixfmt" ]; # It's probably a bug and is not supposed to be here.
      }; # nix

      ts_ls = {
        enable = true;
        autostart = true;
      }; # typescript

      bashls = {
        enable = true;
        autostart = true;
      }; # bash

      dockerls = {
        enable = true;
        autostart = true;
      }; # dockerfile
    };
    keymaps.lspBuf = {
      K = "hover";
      gD = "references";
      gd = "definition";
      gi = "implementation";
      gt = "type_definition";
    };
  };
}
