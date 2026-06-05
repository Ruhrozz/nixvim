{
  plugins.none-ls = {
    enable = true;
    sources = {
      diagnostics = {
        yamllint.enable = true; # yaml
        codespell.enable = true; # english
      };
      formatting = {
        nixfmt.enable = true; # nix
        yamlfmt.enable = true; # yaml
        codespell.enable = true; # english
        shfmt = {
          enable = true;
          settings = {
            extra_args = [ "--indent" "4" "--space-redirects" "--simplify" ];
          };
        }; # bash
        mdformat.enable = true; # markdown
      };
    };
  };

}
