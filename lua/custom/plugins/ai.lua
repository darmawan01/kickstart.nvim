-- Claude Code in nvim. Requires the `claude` CLI on PATH.
return {
  {
    'coder/claudecode.nvim',
    dependencies = { 'folke/snacks.nvim' },
    config = true,
    keys = {
      { '<leader>a',  nil,                              desc = '[A]I / Claude' },
      { '<leader>aa', '<cmd>ClaudeCode<cr>',            desc = 'Toggle Claude' },
      { '<leader>af', '<cmd>ClaudeCodeFocus<cr>',       desc = '[F]ocus Claude' },
      { '<leader>ar', '<cmd>ClaudeCode --resume<cr>',   desc = '[R]esume conversation' },
      { '<leader>aC', '<cmd>ClaudeCode --continue<cr>', desc = '[C]ontinue last' },
      { '<leader>am', '<cmd>ClaudeCodeSelectModel<cr>', desc = 'Select [M]odel' },
      { '<leader>ab', '<cmd>ClaudeCodeAdd %<cr>',       desc = 'Add current [B]uffer' },
      { '<leader>as', '<cmd>ClaudeCodeSend<cr>',        desc = '[S]end selection', mode = 'v' },
      { '<leader>ay', '<cmd>ClaudeCodeDiffAccept<cr>',  desc = '[Y]es / accept diff' },
      { '<leader>an', '<cmd>ClaudeCodeDiffDeny<cr>',    desc = '[N]o / deny diff' },
    },
  },
}
