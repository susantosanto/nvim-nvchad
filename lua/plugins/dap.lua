-- DAP plugin for JavaScript debugging
return {
  -- Debug Adapter Protocol support for JavaScript/TypeScript
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',
    
    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',
    
    -- Installs the debug adapters for you
    'mason-org/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',
    
    -- JavaScript debug adapter
    'microsoft/vscode-js-debug',
  },
  keys = {
    -- Basic debugging keymaps with non-conflicting keys starting with <leader>d
    {
      '<leader>dg',
      function()
        require('dap').continue()
      end,
      desc = 'Debug: Start/Continue',
    },
    {
      '<leader>do',
      function()
        require('dap').step_over()
      end,
      desc = 'Debug: Step Over',
    },
    {
      '<leader>di',
      function()
        require('dap').step_into()
      end,
      desc = 'Debug: Step Into',
    },
    {
      '<leader>du',
      function()
        require('dap').step_out()
      end,
      desc = 'Debug: Step Out',
    },
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'Debug: Toggle Breakpoint',
    },
    {
      '<leader>dB',
      function()
        require('dap').set_breakpoint(nil, nil, vim.fn.input 'Breakpoint condition: ')
      end,
      desc = 'Debug: Set Breakpoint Condition',
    },
    {
      '<leader>dr',
      function()
        require('dap').run_to_cursor()
      end,
      desc = 'Debug: Run to cursor',
    },
    {
      '<leader>dw',
      function()
        require('dap').repl.toggle()
      end,
      desc = 'Debug: Toggle REPL',
    },
    {
      '<leader>dt',
      function()
        require('dapui').toggle()
      end,
      desc = 'Debug: Toggle UI',
    },
    {
      '<leader>dn',
      function()
        require('dap').terminate()
      end,
      desc = 'Debug: Terminate',
    },
    {
      '<leader>ds',
      function()
        require('dap').session()
      end,
      desc = 'Debug: Session Info',
    },
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- JavaScript debug adapter
        'js-debug-adapter',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup({
      layouts = {
        {
          elements = {
            { id = "scopes",      size = 0.25 },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks",      size = 0.25 },
            { id = "watches",     size = 0.25 },
          },
          size = 40,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 10,
          position = "bottom",
        },
      },
      controls = {
        enabled = true,
        element = "repl",
      },
    })

    -- Set up JavaScript/TypeScript debugging
    -- Using the js-debug-adapter which supports Node.js and browser debugging
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = '${port}',
      executable = {
        command = 'node',
        args = { vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js', '${port}' }
      }
    }

    -- Configuration for JavaScript debugging
    dap.configurations.javascript = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        cwd = '${workspaceFolder}',
      },
      {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach to process',
        processId = require('dap.utils').pick_process,
        cwd = '${workspaceFolder}',
      },
    }

    -- Configuration for TypeScript debugging
    dap.configurations.typescript = {
      {
        type = 'pwa-node',
        request = 'launch',
        name = 'Launch file',
        program = '${file}',
        cwd = '${workspaceFolder}',
      },
      {
        type = 'pwa-node',
        request = 'attach',
        name = 'Attach to process',
        processId = require('dap.utils').pick_process,
        cwd = '${workspaceFolder}',
      },
    }

    -- Configuration for JavaScript React debugging
    dap.configurations.javascriptreact = {
      {
        type = 'pwa-chrome',
        request = 'launch',
        name = 'Launch Chrome against localhost',
        url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}',
      },
    }

    -- Configuration for TypeScript React debugging
    dap.configurations.typescriptreact = {
      {
        type = 'pwa-chrome',
        request = 'launch',
        name = 'Launch Chrome against localhost',
        url = 'http://localhost:3000',
        webRoot = '${workspaceFolder}',
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
  end,
}