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
      { '<F5>',  function() require('dap').continue() end,  desc = 'Debug: Continue' },
      { '<F10>', function() require('dap').step_over() end, desc = 'Debug: Step Over' },
      { '<F11>', function() require('dap').step_into() end, desc = 'Debug: Step Into' },
      { '<F12>', function() require('dap').step_out() end,  desc = 'Debug: Step Out' },
      { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle [B]reakpoint' },
      { '<leader>dB', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Conditional [B]reakpoint' },
      { '<leader>du', function() require('dapui').toggle() end,        desc = 'Toggle [U]I' },
      { '<leader>dr', function() require('dap').repl.toggle() end,     desc = 'Toggle [R]EPL' },
      { '<leader>dl', function() require('dap').run_last() end,        desc = 'Run [L]ast' },
      { '<leader>dt', function() require('dap-go').debug_test() end,   desc = 'Debug Go [T]est' },
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
    end,
  },
}
