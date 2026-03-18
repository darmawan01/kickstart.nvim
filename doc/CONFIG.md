# Neovim Configuration Reference

Based on kickstart.nvim, customized with additional plugins and keymaps.

## Leader Key: `Space`

## Options (`lua/options.lua`)

| Setting | Value | Notes |
|---------|-------|-------|
| Relative line numbers | on | With absolute current line |
| Tab/indent width | 2 spaces | expandtab enabled |
| Line wrap | off | |
| Search | case-insensitive | Smart case when uppercase used |
| Clipboard | system (`unnamedplus`) | |
| Mouse | enabled (`a`) | |
| Splits | right and below | |
| Scrolloff | 10 lines | |
| Persistent undo | on | |
| Fold provider | nvim-ufo (treesitter + indent) | |
| Nerd Font | enabled | |
| Theme | tokyonight-night | |

### Filetype Colorcolumn
- **Python**: 80, 120
- **JS/TS/TSX**: 120

---

## Keymaps

### General (`lua/keymaps.lua`)

| Mode | Key | Action |
|------|-----|--------|
| n | `<Esc>` | Clear search highlight |
| i | `jk` | Exit insert mode |
| i | `<C-s>` | Show function signature |
| n | `<leader>e` | Show diagnostic float |
| n | `<leader>q` | Diagnostic quickfix list |
| n | `[d` / `]d` | Previous / next diagnostic |
| t | `<Esc><Esc>` | Exit terminal mode |

### Splits

| Key | Action |
|-----|--------|
| `<leader>sv` | Split vertically |
| `<leader>sh` | Split horizontally |
| `<leader>se` | Equalize splits |
| `<leader>sx` | Close split |

### Buffers (bufferline)

| Key | Action |
|-----|--------|
| `<leader>bn` | Next buffer |
| `<leader>bb` | Previous buffer |
| `<leader>bmp` | Move buffer left |
| `<leader>bmn` | Move buffer right |
| `<leader>bf` | Pick buffer |
| `<leader>bx` | Delete buffer |

### File Explorer

| Key | Action |
|-----|--------|
| `<C-e>e` | Toggle NvimTree |
| `<C-e>f` | Find file in NvimTree |
| `\\` | Toggle NeoTree |

### Telescope (search)

| Key | Action |
|-----|--------|
| `<leader>sf` | Find files |
| `<leader>sg` | Live grep |
| `<leader>sa` | Live grep with args |
| `<leader>sw` | Grep current word |
| `<leader>sd` | Search diagnostics |
| `<leader>sr` | Resume last search |
| `<leader>s.` | Recent files |
| `<leader>s?` | Search help tags |
| `<leader>sk` | Search keymaps |
| `<leader>ss` | Search Telescope builtins |
| `<leader>sn` | Search nvim config files |
| `<leader>s/` | Grep in open files |
| `<leader>/` | Fuzzy find in current buffer |
| `<leader><leader>` | Find open buffers |

### LSP (active when server attached)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gD` | Go to declaration |
| `gr` | Go to references |
| `gI` | Go to implementation |
| `K` | Hover documentation |
| `<leader>D` | Type definition |
| `<leader>ds` | Document symbols |
| `<leader>ws` | Workspace symbols |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code action |
| `<leader>ro` | Organize imports (TS) |
| `<leader>th` | Toggle inlay hints |

### Completion (insert mode)

| Key | Action |
|-----|--------|
| `<C-j>` / `<C-k>` | Next / previous item |
| `<CR>` | Confirm selection |
| `<C-Space>` | Trigger completion |
| `<C-b>` / `<C-f>` | Scroll docs |
| `<C-l>` / `<C-h>` | Next / prev snippet placeholder |

### Git (gitsigns)

| Key | Action |
|-----|--------|
| `]c` / `[c` | Next / prev git change |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage buffer |
| `<leader>hu` | Undo stage hunk |
| `<leader>hR` | Reset buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hb` | Blame line |
| `<leader>hd` | Diff index |
| `<leader>hD` | Diff last commit |
| `<leader>tb` | Toggle inline blame |
| `<leader>tD` | Toggle deleted lines |

### Debug (DAP)

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle DAP UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Conditional breakpoint |

### Motion (leap.nvim)

| Key | Action |
|-----|--------|
| `s` | Leap forward |
| `S` | Leap backward |
| `gs` | Leap from window |

### mini.move (move lines/selections)

| Key | Action |
|-----|--------|
| `<M-h>` | Move left |
| `<M-l>` | Move right |
| `<M-j>` | Move down |
| `<M-k>` | Move up |

### Other

| Mode | Key | Action |
|------|-----|--------|
| n | `<leader>f` | Format buffer (conform) |
| n | `<leader>o` | Toggle code outline |
| n | `<leader>ct` | Toggle treesitter context |
| v | `<leader>ql` | Transform lines to quoted list |

---

## Plugins

### Core
| Plugin | Purpose |
|--------|---------|
| lazy.nvim | Package manager |
| which-key.nvim | Show pending keybinds |
| telescope.nvim | Fuzzy finder |
| nvim-lspconfig | LSP configuration |
| nvim-cmp | Autocompletion |
| nvim-treesitter | Syntax highlighting |
| conform.nvim | Code formatting |
| nvim-lint | Async linting |
| nvim-dap | Debugging |
| gitsigns.nvim | Git integration |
| todo-comments.nvim | Highlight TODO/FIXME |
| mini.nvim | Statusline, text objects, move, cursorword, hipatterns, indentscope |
| nvim-autopairs | Auto-close brackets/quotes |

### Custom
| Plugin | Purpose |
|--------|---------|
| nvim-tree.lua | File explorer (float, 80% window) |
| neo-tree.nvim | Alternative file explorer |
| bufferline.nvim | Buffer tabs |
| nvim-bufdel | Better buffer deletion |
| barbecue.nvim | Breadcrumb navigation |
| nvim-surround | Change/add/delete surrounds |
| leap.nvim | Fast motion |
| outline.nvim | Code outline |
| nvim-ufo | Advanced code folding |
| treesitter-context | Sticky function context |
| git-conflict.nvim | Merge conflict resolution |
| go.nvim | Go development tools |
| tailwind-fold.nvim | Fold Tailwind classes |
| vim-sleuth | Auto-detect indent |
| Comment.nvim | Toggle comments (`gc`) |

---

## Language Servers

| Server | Language |
|--------|----------|
| ts_ls | TypeScript / JavaScript |
| denols | Deno |
| tailwindcss | Tailwind CSS |
| emmet_ls | HTML/JSX/CSS emmet |
| biome | Biome |
| eslint | ESLint |
| htmx | HTMX |
| html | HTML |
| cssls | CSS |
| lua_ls | Lua |

## Formatters (conform.nvim)

| Filetype | Formatter |
|----------|-----------|
| Lua | stylua |
| JS/TS/JSX/TSX | prettierd (fallback: prettier) |
| Python | ruff_format, ruff_fix |
| Go | goimports, gofumpt |
| SQL | sqlfluff |

## Linters (nvim-lint)

| Filetype | Linter |
|----------|--------|
| Markdown | markdownlint |
