-- Modules
require("remaps")
require("lazy_init")
require("cmp_setup")
require('lsp')

-- Basics
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.wrap = false
vim.o.mouse = "a"

-- Tabs
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.tabstop = 8
vim.o.softtabstop = 0
vim.o.expandtab = true

-- Search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true

-- Visuals
vim.o.signcolumn = "yes"
vim.o.scrolloff = 10
vim.o.sidescrolloff = 8
vim.o.breakindent = true
vim.o.completeopt = "menuone,noselect"
vim.o.termguicolors = true
vim.o.colorcolumn = "100,120"
vim.cmd.colorscheme "catppuccin-mocha"
vim.o.winborder = "rounded"

-- Files
vim.o.undofile = true
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.autoread = true
vim.o.autowrite = false

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
