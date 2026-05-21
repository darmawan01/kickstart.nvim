return {
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        lsp_doc_border = true,
      },
      routes = {
        -- Hide noisy "file written" messages
        { filter = { event = 'msg_show', kind = '', find = 'written' }, opts = { skip = true } },
      },
    },
  },

  -- Required by claudecode.nvim and a generally useful util/UI grab bag.
  -- Kept minimal so it doesn't conflict with telescope/fff.
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      notifier = { enabled = false }, -- noice handles this
      dashboard = { enabled = false },
      picker = { enabled = false },   -- we use telescope + fff
    },
  },
}
