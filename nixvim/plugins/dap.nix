{
  plugins.dap = {
    enable = true;
    signs = {
      dapBreakpoint.text = "B";
      dapBreakpointCondition.text = "C";
      dapLogPoint.text = "L";
      dapStopped.text = ">";
      dapBreakpointRejected.text = "R";
    };
    luaConfig.post = ''
      local launch_cwd = vim.env.PWD or vim.fn.getcwd(-1, -1)

      local function split_args(args_string)
        local utils = require("dap.utils")
        if utils.splitstr and vim.fn.has("nvim-0.10") == 1 then
          return utils.splitstr(args_string)
        end
        return vim.split(args_string, " +")
      end

      local function input_args_from_launch_cwd()
        local current_cwd = vim.fn.getcwd(0)
        pcall(vim.cmd.lcd, vim.fn.fnameescape(launch_cwd))
        local args_string = vim.fn.input("Arguments: ", "", "file")
        pcall(vim.cmd.lcd, vim.fn.fnameescape(current_cwd))
        return split_args(args_string)
      end

      for _, config in ipairs(require("dap").configurations.python or {}) do
        if config.request == "launch" then
          config.cwd = launch_cwd

          if config.name == "file:args" then
            config.args = input_args_from_launch_cwd
          end
        end
      end

      vim.api.nvim_create_user_command("DapPythonCwdCheck", function()
        local lines = {
          "vim.env.PWD: " .. tostring(vim.env.PWD),
          "current cwd: " .. tostring(vim.fn.getcwd()),
          "launch cwd: " .. tostring(launch_cwd),
          "",
          "python configurations:",
        }

        for index, config in ipairs(require("dap").configurations.python or {}) do
          table.insert(lines, string.format(
            "%d. %s request=%s cwd=%s",
            index,
            tostring(config.name),
            tostring(config.request),
            tostring(config.cwd)
          ))
        end

        print(table.concat(lines, "\n"))
      end, {})
    '';
  };

  plugins.dap-python = {
    enable = true;
    settings = {
      console = "integratedTerminal";
      includeConfigs = true;
    };
  };

  plugins.dap-ui = {
    enable = true;
    luaConfig.post = ''
      local dap = require("dap")
      local dapui = require("dapui")

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    '';
  };

  plugins.dap-virtual-text = {
    enable = true;
    settings = {
      commented = true;
      virt_text_pos = "eol";
    };
  };
}
