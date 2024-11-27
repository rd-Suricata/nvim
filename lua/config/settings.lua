
vim.g.mapleader = ' '

local opt = vim.o

opt.number = true
opt.relativenumber = true
opt.clipboard = 'unnamedplus'
opt.wrap = false
opt.smartindent = true
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.termguicolors = true
opt.conceallevel = 2

vim.g.obsidian_ui_enable = false

vim.cmd [[
  augroup indent_settings
    autocmd!
    autocmd BufEnter * setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  augroup END
]]
-- for move between start an end of line
vim.api.nvim_set_keymap('n', '<S-h>', '^', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-l>', '$', { noremap = true })
--vim.cmd([[noremap \ :Neotree reveal<cr>]])
vim.cmd([[noremap \ :Neotree reveal<cr>]])

vim.api.nvim_set_keymap('n', '<Leader>r', [[:!cargo run<CR>]], { noremap = true, silent = true })

