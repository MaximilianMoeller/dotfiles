return {
	"toppair/peek.nvim",
	build = "deno task --quiet build:fast",
	-- might need to be reinstalled if deno is installed after the plugin
	enabled = function()
		return vim.fn.executable('deno') == 1
	end,
	event = { "VeryLazy" },
	config = function(_, opts)
		require("peek").setup(opts)
		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	end,
	opts = {
		auto_load = true, -- whether to automatically load preview when
		-- entering *another* markdown buffer
		-- this does not start the preview, it just updates it (good!)
		close_on_bdelete = true, -- close preview window on buffer delete

		syntax = true,     -- enable syntax highlighting, affects performance

		theme = 'dark',    -- 'dark' or 'light'

		update_on_change = true,

		app = { 'firefox', '--new-window' },

		filetype = { 'markdown' }, -- list of filetypes to recognize as markdown

		-- relevant if update_on_change is true
		throttle_at = 200000, -- start throttling when file exceeds this
		-- amount of bytes in size
		throttle_time = 'auto', -- minimum amount of time in milliseconds
		-- that has to pass before starting new render
	},
	keys = {
		{ "<leader>xl", "<cmd>PeekOpen<cr>", desc = "Markdown preview", ft = "markdown" },
	},
}
