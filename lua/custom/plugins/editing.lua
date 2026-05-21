return {
  -- Jump anywhere visible with `s{char}{char}`
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
    },
  },

  -- Edit the filesystem as a buffer
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    opts = {
      default_file_explorer = true,
      view_options = { show_hidden = true },
      keymaps = {
        ['<C-h>'] = false,
        ['<C-l>'] = false,
      },
    },
    keys = {
      { '-',          '<cmd>Oil<cr>', desc = 'Open parent (Oil)' },
      { '<leader>o',  '<cmd>Oil<cr>', desc = '[O]il file explorer' },
    },
  },

  -- Harpoon v2 — pinned files
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function() require('harpoon'):setup() end,
    keys = {
      { '<leader>m',  nil, desc = 'Har[m]oon' }, -- group label
      { '<leader>ma', function() require('harpoon'):list():add() end, desc = '[A]dd file' },
      { '<leader>mm', function() local h = require('harpoon'); h.ui:toggle_quick_menu(h:list()) end, desc = 'Toggle [M]enu' },
      { '<leader>1',  function() require('harpoon'):list():select(1) end, desc = 'Harpoon 1' },
      { '<leader>2',  function() require('harpoon'):list():select(2) end, desc = 'Harpoon 2' },
      { '<leader>3',  function() require('harpoon'):list():select(3) end, desc = 'Harpoon 3' },
      { '<leader>4',  function() require('harpoon'):list():select(4) end, desc = 'Harpoon 4' },
    },
  },

  -- Project find/replace with preview
  {
    'MagicDuck/grug-far.nvim',
    cmd = 'GrugFar',
    opts = {},
    keys = {
      { '<leader>sR', '<cmd>GrugFar<cr>', desc = '[S]earch & [R]eplace (grug-far)' },
    },
  },

  -- Diagnostics / refs / quickfix pane
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    opts = {},
    keys = {
      { '<leader>tr', '<cmd>Trouble diagnostics toggle<cr>',                        desc = '[T]rouble [R]efresh diagnostics' },
      { '<leader>tR', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',           desc = '[T]rouble buffer diagnostics' },
      { '<leader>ts', '<cmd>Trouble symbols toggle focus=false<cr>',                desc = '[T]rouble [S]ymbols' },
      { '<leader>tl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', desc = '[T]rouble [L]SP defs/refs' },
      { '<leader>tq', '<cmd>Trouble qflist toggle<cr>',                             desc = '[T]rouble [Q]uickfix' },
    },
  },
}
