-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 4

-- Leader keys must be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Automatic indentation
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- General editing
-- vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- NetRW
vim.g.netrw_nogx = 0

-- VimTeX
vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_compiler_method = "latexmk"
vim.g.vimtex_view_forward_search_on_start = 1

-- Vim Configs
vim.opt.cursorline = true
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.o.winborder = "rounded"
vim.opt.fillchars:append({ eob = " " }) -- يخفي علامات ~ بعد نهاية الملف
vim.opt.showmode = false -- lualine بتعرض الـ mode أصلًا

-- User Commands
vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})
