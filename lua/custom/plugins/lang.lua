return {
  -- TS/JS: faster than ts_ls, talks tsserver protocol directly.
  -- NOTE: ts_ls is disabled in init.lua so we don't get duplicate diagnostics.
  {
    'pmizio/typescript-tools.nvim',
    ft = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact' },
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    opts = {},
  },

  -- Auto close/rename HTML/JSX tags (treesitter based)
  {
    'windwp/nvim-ts-autotag',
    ft = { 'html', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'xml', 'markdown' },
    opts = {},
  },

  -- npm latest versions inline in package.json
  {
    'vuki656/package-info.nvim',
    dependencies = 'MunifTanjim/nui.nvim',
    event = { 'BufRead package.json' },
    opts = {},
  },

  -- Go niceties: tests, struct tags, impl, alternate file, etc.
  {
    'ray-x/go.nvim',
    ft = { 'go', 'gomod', 'gosum', 'gowork' },
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig',
      'nvim-treesitter/nvim-treesitter',
    },
    build = ':lua require("go.install").update_all_sync()',
    opts = {},
  },

  -- Rust: rustaceanvim configures rust-analyzer itself (do NOT add rust_analyzer to servers table)
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
    ft = { 'rust' },
  },

  -- Cargo.toml versions/features inline
  {
    'saecki/crates.nvim',
    event = { 'BufRead Cargo.toml' },
    opts = {},
  },

  -- Tailwind: conceal long class strings, color preview, sort
  {
    'luckasRanarison/tailwind-tools.nvim',
    ft = { 'html', 'css', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'astro' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },

  -- Color swatches next to Tailwind classes in completion menu
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    dependencies = 'hrsh7th/nvim-cmp',
    opts = { color_square_width = 2 },
  },

  -- Flutter / Dart: configures dartls, hot reload, devices, emulators, outline.
  -- Needs the `flutter` CLI on PATH.
  {
    'akinsho/flutter-tools.nvim',
    ft = { 'dart' },
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
    opts = {
      lsp = {
        color = { enabled = true },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = 'prompt',
        },
      },
      widget_guides = { enabled = true },
      outline = { auto_open = false },
      dev_log = { enabled = true, open_cmd = 'tabedit' },
    },
    keys = {
      { '<leader>F',  nil,                       desc = '[F]lutter' }, -- group
      { '<leader>Fr', '<cmd>FlutterRun<cr>',     desc = '[R]un' },
      { '<leader>FR', '<cmd>FlutterRestart<cr>', desc = 'Hot [R]estart' },
      { '<leader>Fl', '<cmd>FlutterReload<cr>',  desc = 'Hot Re[l]oad' },
      { '<leader>Fq', '<cmd>FlutterQuit<cr>',    desc = '[Q]uit' },
      { '<leader>Fd', '<cmd>FlutterDevices<cr>', desc = '[D]evices' },
      { '<leader>Fe', '<cmd>FlutterEmulators<cr>', desc = '[E]mulators' },
      { '<leader>Fo', '<cmd>FlutterOutlineToggle<cr>', desc = 'Toggle [O]utline' },
      { '<leader>Fp', '<cmd>FlutterPubGet<cr>',  desc = '[P]ub get' },
      { '<leader>Fu', '<cmd>FlutterPubUpgrade<cr>', desc = 'Pub [U]pgrade' },
      { '<leader>Fc', '<cmd>FlutterLogClear<cr>', desc = '[C]lear dev log' },
    },
  },
}
