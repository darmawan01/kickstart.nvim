return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      { 'rcarriga/nvim-dap-ui',         dependencies = { 'nvim-neotest/nvim-nio' } },
      'theHamsta/nvim-dap-virtual-text',
      'jay-babu/mason-nvim-dap.nvim',
      'leoluz/nvim-dap-go',
    },
    keys = {
      { '<leader>d',  nil, desc = '[D]ebug' }, -- group label
      -- Universal: starts session (prompts to pick config) or continues a running one
      { '<F5>',  function() require('dap').continue() end,  desc = 'Debug: Start / Continue' },
      { '<F10>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
      { '<F11>', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
      { '<F12>', function() require('dap').step_out() end,  desc = 'Debug: Step Out' },
      { '<S-F5>', function() require('dap').terminate() end, desc = 'Debug: Terminate' },
      { '<leader>dc', function() require('dap').continue() end,        desc = '[C]ontinue / start' },
      { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle [B]reakpoint' },
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Conditional [B]reakpoint' },
      { '<leader>du', function() require('dapui').toggle() end,        desc = 'Toggle [U]I' },
      { '<leader>dr', function() require('dap').repl.toggle() end,     desc = 'Toggle [R]EPL' },
      { '<leader>dl', function() require('dap').run_last() end,        desc = 'Run [L]ast' },
      { '<leader>dx', function() require('dap').terminate() end,       desc = 'Terminate' },
      -- Go-specific
      { '<leader>dt', function() require('dap-go').debug_test() end,   desc = 'Debug Go [T]est (cursor)' },
      { '<leader>dT', function() require('dap-go').debug_last_test() end, desc = 'Debug last Go [T]est' },
    },
    config = function()
      local dap   = require('dap')
      local dapui = require('dapui')

      require('mason-nvim-dap').setup {
        automatic_installation = true,
        handlers = {},
        ensure_installed = { 'delve', 'js-debug-adapter' },
      }

      dapui.setup()
      require('nvim-dap-virtual-text').setup()
      require('dap-go').setup()

      dap.listeners.after.event_initialized['dapui_config']  = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui_config']  = function() dapui.close() end
      dap.listeners.before.event_exited['dapui_config']      = function() dapui.close() end

      vim.fn.sign_define('DapBreakpoint',          { text = '●', texthl = 'DiagnosticError' })
      vim.fn.sign_define('DapBreakpointCondition', { text = '◐', texthl = 'DiagnosticWarn' })
      vim.fn.sign_define('DapStopped',             { text = '▶', texthl = 'DiagnosticInfo' })

      -- ─── JS / TS / React / Node configs (via js-debug-adapter from Mason) ───
      local js_debug = vim.fn.stdpath('data')
        .. '/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js'

      for _, adapter in ipairs { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal' } do
        dap.adapters[adapter] = {
          type = 'server',
          host = 'localhost',
          port = '${port}',
          executable = {
            command = 'node',
            args = { js_debug, '${port}' },
          },
        }
      end

      for _, ft in ipairs { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' } do
        dap.configurations[ft] = {
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file (Node)',
            program = '${file}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            runtimeArgs = { '--enable-source-maps' },
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch via ts-node',
            runtimeExecutable = 'node',
            runtimeArgs = { '--loader', 'ts-node/esm' },
            program = '${file}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**', 'node_modules/**' },
          },
          {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach to running Node (--inspect)',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
            sourceMaps = true,
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Debug Jest (current file)',
            runtimeExecutable = 'node',
            runtimeArgs = { './node_modules/.bin/jest', '--runInBand', '${file}' },
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
            internalConsoleOptions = 'neverOpen',
          },
          {
            type = 'pwa-node',
            request = 'launch',
            name = 'Debug Vitest (current file)',
            runtimeExecutable = 'node',
            runtimeArgs = { './node_modules/.bin/vitest', 'run', '${file}' },
            cwd = '${workspaceFolder}',
            console = 'integratedTerminal',
          },
          {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'Launch Chrome → React dev server (localhost:3000)',
            url = 'http://localhost:3000',
            webRoot = '${workspaceFolder}',
            sourceMaps = true,
            userDataDir = false,
          },
          {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'Launch Chrome → Vite (localhost:5173)',
            url = 'http://localhost:5173',
            webRoot = '${workspaceFolder}',
            sourceMaps = true,
            userDataDir = false,
          },
        }
      end
    end,
  },
}
