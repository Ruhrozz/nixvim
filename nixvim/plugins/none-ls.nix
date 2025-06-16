{
  plugins.none-ls = {
    enable = true;
    sources = {
      diagnostics = {
        yamllint.enable = true; # yaml
        codespell.enable = true; # english
        pylint = {
          enable = true;
          package = null;
          settings = { extra_args = [ "--max-line-length" "120" ]; };
        };
      };
      formatting = {
        black = {
          enable = true;
          settings = { extra_args = [ "--line-length" "120" ]; };
        }; # python
        isort = {
          enable = true;
          settings = {
            extra_args = [
              "--profile"
              "black"
              "--line-length"
              "120"
              "--ensure_newline_before_comments"
              "true"
              "--force_single_line"
              "true"
            ];
          };
        }; # python
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
