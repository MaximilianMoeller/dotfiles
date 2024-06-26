-- using neo2 keyboard-layout arrow-keys are on the main board, no need for hjkl!
vim.keymap.set('', 'h', '<nop>', {})
vim.keymap.set('', 'j', '<nop>', {})
vim.keymap.set('', 'k', '<nop>', {})
vim.keymap.set('', 'l', '<nop>', {})

-- kitty supports CSI u, i.e., tab and ctrl-i can be differentiated
vim.keymap.set('', '<tab>', '<nop>', {})

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- temporary for reloading init.lua
-- vim.keymap.set('n', '<leader>r', '<cmd>source $MYVIMRC<cr>', {})
-- no longer highlight the current search
vim.keymap.set('', '<leader>/', '<cmd>nohlsearch<cr>', {})


-- jumps
-- jump to definition
-- only in normal mode, because <c-g> has a different meaning in visual/select mode (namely, switching between the two).
vim.keymap.set('n', '<c-g>', '<c-]>', {})
-- jupm between last jumps
vim.keymap.set('', '<c-i>', '<c-o>', {})
vim.keymap.set('', '<c-e>', '<c-i>', {})

-- scrolling
vim.keymap.set('', '<c-a>', '<c-e>', {})
vim.keymap.set('', '<c-l>', '<c-y>', {})


-- windows
vim.keymap.set('', '<leader>h', '<cmd>split<cr>', {})
vim.keymap.set('', '<leader>v', '<cmd>vsplit<cr>', {})

vim.keymap.set('', '<leader>l', '<c-w><Up>', { silent = true })
vim.keymap.set('', '<leader>i', '<c-w><Left>', { silent = true })
vim.keymap.set('', '<leader>e', '<c-w><Right>', { silent = true })
vim.keymap.set('', '<leader>a', '<c-w><Down>', { silent = true })
