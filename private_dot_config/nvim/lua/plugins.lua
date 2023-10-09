-- https://dev.to/vonheikemen/neovim-using-vim-plug-in-lua-3oom
local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

Plug 'SirVer/ultisnips'
Plug 'lervag/vimtex'
Plug 'preservim/nerdtree'


vim.call('plug#end')

-- move to separate plugin settings file
-- and translate to lua
vim.cmd [[
	let g:UltiSnipsExpandTrigger = '<tab>'
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'


	let g:vimtex_mappings_prefix= '<localleader>x'
	let g:vimtex_view_method='zathura'

	let g:NERDTreeMapOpenSplit = 's'
	let g:NERDTreeMapOpenVSplit = 'v'
]]
-- vim.keymap.set('n', '<leader>t', ':NERDTreeToggle<CR>', {})
