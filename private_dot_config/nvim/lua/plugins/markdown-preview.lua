local M = {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function() vim.fn["mkdp#util#install"]() end,
	keys = {
		{ "<leader>xl", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview" }
	}
}

-- always open markdown preview in new window
vim.cmd [[
function CustomOpenMarkdownPreview (url)
	execute "silent ! firefox --new-window " . a:url
	endfunction
	let g:mkdp_browserfunc = 'CustomOpenMarkdownPreview'
	let g:mkdp_auto_start = 0
	let g:mkdp_auto_close = 0
	]]

return M
