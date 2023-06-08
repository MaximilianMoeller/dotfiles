-- using neo2 keyboard-layout arrow-keys are on the main board, no need for hjkl!
vim.keymap.set('', 'h', '<nop>', {})
vim.keymap.set('', 'j', '<nop>', {})
vim.keymap.set('', 'k', '<nop>', {})
vim.keymap.set('', 'l', '<nop>', {})

-- since 'h' and 'l' are free to use now (l for local)
vim.g.mapleader = 'h'
vim.g.maplocalleader = 'l'
-- temporary for reloading init.lua
vim.keymap.set('n', '<leader>r', '<cmd>source $MYVIMRC<cr>', {})
-- no longer highlight the current search
vim.keymap.set('', '<leader>/', '<cmd>nohlsearch<cr>', {})
-- write current or all buffers
vim.keymap.set('', '<localleader>w', '<cmd>write<cr>', {})
vim.keymap.set('', '<leader>w', '<cmd>wall<cr>', {})

-- windows
vim.keymap.set('', '<localleader>h', '<cmd>split<cr>', {})
vim.keymap.set('', '<localleader>v', '<cmd>vsplit<cr>', {})

vim.keymap.set('', '<c-l>', '<c-w><Up>', {silent=true})
vim.keymap.set('', '<c-i>', '<c-w><Left>', {silent=true})
vim.keymap.set('', '<c-e>', '<c-w><Right>', {silent=true})
vim.keymap.set('', '<c-a>', '<c-w><Down>', {silent=true})

-- line numbering
vim.opt.number = true -- show number lines
vim.opt.relativenumber = true -- show relative numbers

-- indentation
vim.opt.tabstop = 4 -- render \t as 4 spaces
vim.opt.shiftwidth = 4 -- indentation is rendered as 4 spaces
vim.opt.softtabstop = 0 -- don't use a mixture of spaces and \t
vim.opt.expandtab = false -- don't use spaces instead of \t when pressing <Tab>
vim.opt.autoindent = true -- copy indent from current line when starting a new line
vim.opt.smartindent = true -- smart indentation for C-like programming languages

-- line wrapping
vim.opt.wrap = true
vim.opt.breakindent = true

vim.opt.showmatch = true -- do not jump to corresponding bracket when inserting a new one (highlighting is still enabled)

-- searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- creating new windows below and to the right instead of above and to the left
vim.opt.splitright = true
vim.opt.splitbelow = true

-- always report on number of changed lines (no threshold)
vim.opt.report = 0
