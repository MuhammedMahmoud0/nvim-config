# nvim-config

My personal Neovim configuration, built around **lazy.nvim** and the native
LSP API (`vim.lsp.config`) of **Neovim 0.12**. It is set up mainly for Go,
JavaScript/TypeScript, and web development.

## Features

- **Plugin manager:** [lazy.nvim](https://github.com/folke/lazy.nvim) with lazy-loading and a committed `lazy-lock.json`
- **LSP:** native `vim.lsp.config` + mason.nvim + mason-lspconfig (servers auto-installed and auto-enabled)
- **Completion:** nvim-cmp + LuaSnip + friendly-snippets
- **Formatting:** conform.nvim (format on save)
- **Linting:** nvim-lint
- **Fuzzy finder:** Telescope (with fzf-native)
- **Syntax:** nvim-treesitter (`main` branch)
- **File explorer:** Neo-tree
- **Git:** gitsigns.nvim
- **UI:** lualine, alpha-nvim (start screen), indent-blankline, which-key
- **Themes:** catppuccin, gruvbox, rose-pine, tokyonight, switchable at runtime with themery.nvim
- **Editing:** nvim-autopairs, nvim-ts-autotag, nvim-surround

## Structure

```
.
├── init.lua
├── lazy-lock.json
└── lua
    ├── config
    │   ├── options.lua      # editor options
    │   ├── keymaps.lua      # general keymaps
    │   └── lazy.lua         # lazy.nvim bootstrap
    └── plugins
        ├── alpha.lua
        ├── colorscheme.lua
        ├── completion.lua
        ├── formatting.lua
        ├── linting.lua
        ├── lsp-config.lua
        ├── lualine.lua
        ├── neo-tree.lua
        ├── telescope.lua
        ├── themery.lua
        ├── treesitter.lua
        └── ...
```

## Requirements

- Neovim **0.12+**
- `git`, `make`, a C compiler (`gcc`)
- [`ripgrep`](https://github.com/BurntSushi/ripgrep) (Telescope live grep)
- [`tree-sitter-cli`](https://github.com/tree-sitter/tree-sitter) (building Treesitter parsers)
- `node` and `npm` (prettier, TypeScript tooling)
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

Clone the repo and start Neovim; plugins install automatically on first launch:

```sh
git clone https://github.com/<your-username>/nvim-config ~/.config/nvim
nvim
```

Then run `:Mason` to check that the language servers and tools were installed,
and `:checkhealth` if something looks wrong.

## Key mappings

Leader key: `<Space>`

| Key | Action |
|---|---|
| `<leader>e` / `<leader>o` | Toggle / focus Neo-tree |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>fb` | Buffers |
| `<leader>fh` | Help tags |
| `<leader>fd` | Diagnostics |
| `<leader>ut` | Choose colorscheme (themery) |
| `<leader>gf` | Format buffer |
| `gd` | Go to definition |
| `K` | Hover (built-in) |
| `<leader>ca` | Code actions |
| `<leader>gr` | References |
| `<leader>rn` | Rename symbol |
| `<leader>dd` | Show diagnostic |
| `<C-s>` | Save all buffers |
| `<leader>y` / `<leader>d` / `<leader>p` | Yank / delete / paste with the system clipboard |

Press `<leader>` and wait to see all available mappings via which-key.

## Language servers

Installed through Mason: `gopls`, `ts_ls`, `lua_ls`, `html`, `cssls`,
`emmet_language_server`. More are listed (commented out) in
`lua/plugins/lsp-config.lua`.

## Notes

- `:LspInfo` is aliased to `:checkhealth vim.lsp`.
- Plugin versions are pinned in `lazy-lock.json`. Run `:Lazy restore` to reproduce them.

## License

MIT
