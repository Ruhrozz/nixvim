{
  plugins.lsp = {
    enable = true;
    servers = {
      pyright = {
        enable = true;
        autostart = true;
      }; # python

      ruff = {
        enable = true;
        autostart = true;
        settings = {
          configurationPreference = "filesystemFirst";
          configuration = {
            "line-length" = 120;
            lint = {
              select = [ "E" "F" "I" ];
              isort = { "force-single-line" = true; };
            };
          };
        };
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
