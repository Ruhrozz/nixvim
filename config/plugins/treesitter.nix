{
  plugins.treesitter = {
    enable = true;

    settings = {
      auto_install = true;
      ensure_installed = "all";
      highlight = {
        additional_vim_regex_highlighting = true;
        custom_captures = { };
        enable = true;
      };
      indent = { enable = true; };
      sync_install = false;
    };
  };
}
