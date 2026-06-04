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

    # - Stage current git hunk
    {
      mode = "n";
      key = "<leader>ga";
      action.__raw = ''
        function()
          local line = vim.fn.line(".")
          require("gitsigns").stage_hunk({ line, line }, { greedy = false })
        end
      '';
      options.silent = true;
    }

    # - Stage selected git lines
    {
      mode = "v";
      key = "<leader>ga";
      action.__raw = ''
        function()
          local start_line = vim.fn.line("v")
          local end_line = vim.fn.line(".")
          if start_line > end_line then
            start_line, end_line = end_line, start_line
          end
          require("gitsigns").stage_hunk({ start_line, end_line }, { greedy = false })
        end
      '';
      options.silent = true;
    }

    # - Restore current git line
    {
      mode = "n";
      key = "<leader>gr";
      action.__raw = ''
        function()
          local line = vim.fn.line(".")
          require("gitsigns").reset_hunk({ line, line }, { greedy = false })
        end
      '';
      options.silent = true;
    }

    # - Restore selected git lines
    {
      mode = "v";
      key = "<leader>gr";
      action.__raw = ''
        function()
          local start_line = vim.fn.line("v")
          local end_line = vim.fn.line(".")
          if start_line > end_line then
            start_line, end_line = end_line, start_line
          end
          require("gitsigns").reset_hunk({ start_line, end_line }, { greedy = false })
        end
      '';
      options.silent = true;
    }

    # - Stage all git changes in current buffer
    {
      mode = "n";
      key = "<leader>gA";
      action.__raw = ''function() require("gitsigns").stage_buffer() end'';
      options.silent = true;
    }

    # - Commit staged git changes
    {
      mode = "n";
      key = "<leader>gc";
      action = "<cmd>Git commit<CR>";
      options.silent = true;
    }

    # - Open git diff
    {
      mode = "n";
      key = "<leader>gd";
      action = "<cmd>Gdiffsplit<CR>";
      options.silent = true;
    }

    # - Push git commits
    {
      mode = "n";
      key = "<leader>gp";
      action = "<cmd>Git push<CR>";
      options.silent = true;
    }

    # - Reset all git changes in current buffer
    {
      mode = "n";
      key = "<leader>gR";
      action.__raw = ''function() require("gitsigns").reset_buffer() end'';
      options.silent = true;
    }

    # - Show git blame for current line
    {
      mode = "n";
      key = "<leader>gb";
      action.__raw = ''function() require("gitsigns").blame_line({ full = true }) end'';
      options.silent = true;
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
      key = "<leader>gD";
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
