{
  extraConfigLua = ''
    vim.api.nvim_create_user_command("DapHelp", function()
      local lines = {
        "DAP Help",
        "",
        "Main flow:",
        "  <leader>db    toggle breakpoint",
        "  <leader>dc    start / continue",
        "  <leader>do    step over",
        "  <leader>di    step into",
        "  <leader>dO    step out",
        "  <leader>dt    terminate",
        "",
        "UI:",
        "  <leader>du    toggle DAP UI",
        "  <leader>dr    open DAP REPL",
        "  <leader>de    eval under cursor / selection",
        "  <leader>dl    run last debug session",
        "",
        "Signs:",
        "  >             current stopped line",
        "  B             breakpoint",
        "",
        "Python configs:",
        "  file          run current file",
        "  file:args     run current file with args",
        "  attach        attach to debugpy process",
        "  file:doctest  debug doctest",
        "",
        "Python cwd:",
        "  launch cwd    directory where nvim was started",
        "  file:args     path completion starts from launch cwd",
        "  check cwd     :DapPythonCwdCheck",
        "",
        "DAP REPL examples:",
        "  import os",
        "  os.getcwd()",
        "  config_path",
        "  from pathlib import Path",
        "  Path(config_path).exists()",
        "  config_path = \"/absolute/path/to/config.yaml\"",
        "",
        "Press q or Esc to close.",
      }

      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      vim.bo[buf].modifiable = false
      vim.bo[buf].bufhidden = "wipe"
      vim.bo[buf].filetype = "dap-help"

      local width = 58
      local height = #lines
      local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        border = "rounded",
        style = "minimal",
        title = " DAP Help ",
        title_pos = "center",
      })

      vim.keymap.set("n", "q", function()
        vim.api.nvim_win_close(win, true)
      end, { buffer = buf, silent = true })

      vim.keymap.set("n", "<Esc>", function()
        vim.api.nvim_win_close(win, true)
      end, { buffer = buf, silent = true })
    end, {})
  '';

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

    # - Toggle debug breakpoint
    {
      mode = "n";
      key = "<leader>db";
      action.__raw = ''function() require("dap").toggle_breakpoint() end'';
      options.silent = true;
    }

    # - Set conditional debug breakpoint
    {
      mode = "n";
      key = "<leader>dB";
      action.__raw = ''
        function()
          require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end
      '';
      options.silent = true;
    }

    # - Start or continue debug session
    {
      mode = "n";
      key = "<leader>dc";
      action.__raw = ''function() require("dap").continue() end'';
      options.silent = true;
    }

    # - Step into debug call
    {
      mode = "n";
      key = "<leader>di";
      action.__raw = ''function() require("dap").step_into() end'';
      options.silent = true;
    }

    # - Step over debug call
    {
      mode = "n";
      key = "<leader>do";
      action.__raw = ''function() require("dap").step_over() end'';
      options.silent = true;
    }

    # - Step out of debug call
    {
      mode = "n";
      key = "<leader>dO";
      action.__raw = ''function() require("dap").step_out() end'';
      options.silent = true;
    }

    # - Terminate debug session
    {
      mode = "n";
      key = "<leader>dt";
      action.__raw = ''function() require("dap").terminate() end'';
      options.silent = true;
    }

    # - Run last debug session
    {
      mode = "n";
      key = "<leader>dl";
      action.__raw = ''function() require("dap").run_last() end'';
      options.silent = true;
    }

    # - Toggle debug UI
    {
      mode = "n";
      key = "<leader>du";
      action.__raw = ''function() require("dapui").toggle() end'';
      options.silent = true;
    }

    # - Open debug REPL
    {
      mode = "n";
      key = "<leader>dr";
      action.__raw = ''function() require("dap").repl.open() end'';
      options.silent = true;
    }

    # - Inspect debug value
    {
      mode = [ "n" "v" ];
      key = "<leader>de";
      action.__raw = ''function() require("dapui").eval() end'';
      options.silent = true;
    }

    # - Show debug help
    {
      mode = "n";
      key = "<leader>dh";
      action = "<cmd>DapHelp<CR>";
      options.silent = true;
    }

    # - Show debug help from terminal buffers
    {
      mode = "t";
      key = "<leader>dh";
      action = "<C-\\><C-n><cmd>DapHelp<CR>";
      options.silent = true;
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
