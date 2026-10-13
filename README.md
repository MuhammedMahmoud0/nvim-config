# nvim-config

Personal Neovim configuration built around **lazy.nvim** and the native LSP client (`vim.lsp.config`) of **Neovim 0.12**. Optimized for Go, JavaScript/TypeScript, and web development.

## Features

- **Plugin manager:** [lazy.nvim](https://github.com/folke/lazy.nvim) with lazy-loading and committed `lazy-lock.json`
- **LSP:** Native `vim.lsp.config` + `mason.nvim` + `mason-lspconfig` + `SchemaStore.nvim` (servers auto-installed and configured)
- **Completion:** `nvim-cmp` + `LuaSnip` + `friendly-snippets`
- **Formatting:** `conform.nvim` (format on save via `stylua`, `prettier`, `goimports`, `gofmt`)
- **Linting:** `nvim-lint` (`eslint_d`, `golangci-lint`, `tidy`)
- **Fuzzy finder:** Telescope (with `telescope-fzf-native`)
- **Syntax:** `nvim-treesitter` (`main` branch)
- **File explorer:** Neo-tree (with file watcher and clipboard yank mappings)
- **Git integration:** `gitsigns.nvim` (hunk navigation, preview, staging, blame)
- **REST client:** `kulala.nvim` for HTTP/REST request execution and inspecting responses
- **Terminal:** `toggleterm.nvim` with custom winbar tab navigation (active outside tmux)
- **Multiplexer:** `vim-tmux-navigator` for seamless navigation between Neovim splits and tmux panes
- **UI:** `lualine.nvim`, `alpha-nvim` (dashboard), `indent-blankline.nvim`, `todo-comments.nvim`, `which-key.nvim`
- **Themes:** Catppuccin (Mocha, Macchiato, Latte, Frappe), Gruvbox, Rosé Pine, Tokyo Night — switchable at runtime with `themery.nvim`
- **Editing:** `nvim-autopairs`, `nvim-ts-autotag`, `nvim-surround`

## Structure

```
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── autocmds.lua     # autocommands (kulala folding, etc.)
    │   ├── keymaps.lua      # general keymaps & window navigation
    │   ├── lazy.lua         # lazy.nvim bootstrap & setup
    │   └── options.lua      # editor options
    └── plugins
        ├── alpha.lua
        ├── autopairs.lua
        ├── colorscheme.lua
        ├── completion.lua
        ├── editor.lua       # indent-blankline, todo-comments, surround, autotag
        ├── formatting.lua   # conform.nvim
        ├── gitsigns.lua
        ├── kulala.lua       # REST client
        ├── linting.lua      # nvim-lint
        ├── lsp-config.lua   # native LSP & mason-lspconfig & SchemaStore
        ├── lualine.lua
        ├── neo-tree.lua
        ├── telescope.lua
        ├── themery.lua      # theme switcher
        ├── tmux-navigator.lua
        ├── toggleterm.lua   # terminal manager
        ├── tools.lua        # mason-tool-installer
        ├── treesitter.lua
        └── which-key.lua
```

## Requirements

- Neovim **0.12+**
- `git`, `make`, a C compiler (`gcc` or `clang`)
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) (Telescope live grep)
- [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter) (building Treesitter parsers)
- `node` and `npm` (Prettier, ESLint, TypeScript tooling)
- `go` (Go tooling)
- A [Nerd Font](https://www.nerdfonts.com/) set in your terminal

On Arch Linux:

```sh
sudo pacman -S neovim git base-devel ripgrep tree-sitter-cli nodejs npm go
```

## Installation

Back up any existing config first:

```sh
mv ~/.config/nvim ~/.config/nvim.bak
```

Clone the repository and launch Neovim; plugins install automatically on first launch:

```sh
git clone https://github.com/MuhammedMahmoud0/nvim-config ~/.config/nvim
nvim
```

Then run `:Mason` to verify installed language servers and formatters, or `:checkhealth` if troubleshooting.

## Key Mappings

Leader key: `<Space>`

### General & Windows

| Key | Action |
|---|---|
| `<C-s>` | Save all buffers (`:wall`) |
| `<leader>y` / `<leader>Y` | Yank to system clipboard |
| `<leader>d` / `<leader>D` | Delete to system clipboard |
| `<leader>p` / `<leader>P` | Paste from system clipboard |
| `<C-h>` / `<C-l>` | Previous / next window cycle (or tmux pane when inside tmux) |
| `<C-j>` / `<C-k>` | Go to lower / upper window (or tmux pane when inside tmux) |

### File Explorer (Neo-tree)

| Key | Action |
|---|---|
| `<leader>e` | Toggle Neo-tree |
| `<leader>o` | Focus Neo-tree |
| `Y` (inside Neo-tree) | Copy file/directory path to clipboard |
| `Z` (inside Neo-tree) | Expand all nodes |

### Fuzzy Finder (Telescope)

| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fd` | Workspace diagnostics |
| `<leader>ft` | Find TODO comments |

### LSP & Code

| Key | Action |
|---|---|
| `gd` | Go to definition |
| `K` | Hover information |
| `<leader>ca` | Code actions |
| `<leader>gr` | References |
| `<leader>rn` | Rename symbol |
| `<leader>dd` | Show diagnostic float |
| `<leader>gf` | Format buffer (`conform.nvim`) |

### Terminal (toggleterm)

*(Available outside tmux)*

| Key | Action |
|---|---|
| `<C-\>` / `<leader>tt` | Toggle terminal |
| `<A-n>` / `<leader>tn` | Create new terminal tab |
| `<C-PageDown>` / `<leader>tl` | Next terminal tab |
| `<C-PageUp>` / `<leader>th` | Previous terminal tab |
| `<leader>tx` / `:TermClose` | Close current terminal |

### REST Client (kulala)

*(Active in `http` and `rest` filetypes)*

| Key | Action |
|---|---|
| `<leader>rs` | Send request under cursor |
| `<leader>ra` | Send all requests |
| `<leader>rr` | Replay last request |
| `]r` / `[r` | Jump to next / previous request |

### Git (gitsigns)

| Key | Action |
|---|---|
| `]h` / `[h` | Next / previous hunk |
| `<leader>hp` | Preview hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hb` | Blame line |

### UI & Themes

| Key | Action |
|---|---|
| `<leader>ut` | Choose colorscheme (`themery.nvim`) |
| `<leader>?` | Show buffer-local keymaps (`which-key`) |

Press `<leader>` and wait to see all available key mappings dynamically categorized via `which-key`.

## Language Servers & Tools

Installed through Mason:
- **LSP:** `gopls`, `ts_ls`, `lua_ls`, `html`, `cssls`, `jsonls` (with SchemaStore), `emmet_language_server`
- **Formatters:** `stylua`, `prettier`, `goimports`
- **Linters:** `eslint_d`, `golangci-lint`, `tidy`

## Notes

- `:LspInfo` is aliased to `:checkhealth vim.lsp`.
- Plugin versions are pinned in `lazy-lock.json`. Run `:Lazy restore` to reproduce them.

## License

MIT
