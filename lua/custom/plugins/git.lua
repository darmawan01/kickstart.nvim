-- LazyGit requires the `lazygit` CLI: brew install lazygit
return {
  {
    'kdheepak/lazygit.nvim',
    cmd = { 'LazyGit', 'LazyGitConfig', 'LazyGitCurrentFile', 'LazyGitFilter', 'LazyGitFilterCurrentFile' },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>g',  nil,                desc = '[G]it' },
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = '[G]it Lazy[G]it' },
    },
  },

  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose', 'DiffviewFileHistory', 'DiffviewToggleFiles' },
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>',          desc = '[D]iffview open' },
      { '<leader>gD', '<cmd>DiffviewClose<cr>',         desc = '[D]iffview close' },
      { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = '[F]ile history (current)' },
      { '<leader>gF', '<cmd>DiffviewFileHistory<cr>',   desc = '[F]ile history (branch)' },
    },
  },

  {
    'NeogitOrg/neogit',
    cmd = 'Neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
    },
    opts = { integrations = { diffview = true } },
    keys = {
      { '<leader>gn', '<cmd>Neogit<cr>', desc = '[N]eogit' },
    },
  },
}
