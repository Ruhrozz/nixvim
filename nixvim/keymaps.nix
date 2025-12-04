{
  keymaps = [
    # - Apply last macro registry again
    {
      action = "@@";
      key = "Q";
      options.silent = true;
      mode = [ "n" "v" ];
    }

    # - Open error in floating windown
    {
      mode = "n";
      key = "<space>e";
      action.__raw = "vim.diagnostic.open_float";
    }

    # - Go to prev error
    {
      mode = "n";
      key = "[d";
      action.__raw = "vim.diagnostic.goto_prev";
    }

    # - Go to next error
    {
      mode = "n";
      key = "]d";
      action.__raw = "vim.diagnostic.goto_next";
    }

    # - Activate all formatters to format current file
    {
      mode = "n";
      key = "<leader>fa";
      action = "<cmd>lua vim.lsp.buf.format({async = true})<CR>";
    }

    # - Navigation in `luasnip`
    {
      action.__raw = ''function() require("luasnip").expand() end'';
      key = "<C-k>";
      mode = [ "i" "n" ];
      options.silent = true;
    }
    {
      action.__raw = ''function() require("luasnip").jump(1) end'';
      key = "<C-l>";
      mode = [ "i" "s" "n" ];
      options.silent = true;
    }
    {
      action.__raw = ''function() require("luasnip").jump(-1) end'';
      key = "<C-j>";
      mode = [ "i" "s" "n" ];
      options.silent = true;
    }
    {
      action.__raw = ''
        function()
          if require("luasnip").choice_active() then
            require("luasnip").change_choice(1)
          end
        end
      '';
      key = "<C-e>";
      mode = [ "i" "s" "n" ];
      options.silent = true;
    }

    # - Generate documentation
    {
      action = "<cmd>Neogen<cr>";
      key = "<leader>gd";
      mode = [ "n" ];
    }

    # - Open Neotree where VIM was launched
    {
      mode = "n";
      key = "\\";
      action = "<cmd>Neotree toggle dir=$PWD<CR>";
    }

    # - Open Neotree near opened file
    {
      mode = "n";
      key = "|";
      action = "<cmd>Neotree toggle dir=%:p:h<CR>";
    }

    # - Open syntaxis tree (plugin: Trouble)
    {
      mode = "n";
      key = "<leader>ts";
      action = "<cmd>Trouble symbols focus=true<cr>";
    }

    # - Open error tree (plugin: Trouble)
    {
      mode = "n";
      key = "<leader>td";
      action = "<cmd>Trouble diagnostics focus=true<cr>";
    }
  ];
}
