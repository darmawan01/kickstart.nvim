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
}
