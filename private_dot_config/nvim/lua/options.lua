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

-- transparent popup-windows
vim.opt.winblend = 25
vim.opt.pumblend = 0
