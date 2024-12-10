return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- some lua functions the authors of neo-tree used
		"MunifTanjim/nui.nvim",  -- UI Component Library
		"nvim-tree/nvim-web-devicons", -- icons for the tree (neo-tree documentation says it’s not strictly required, but I *need* them)
	},
	lazy = false,                -- required for hijacking netrw
	opts = {
		close_if_last_window = true,
		add_blank_line_at_top = true,

		window = {
			position = "left",
			width = 40,
		},

		popup_border_style = "rounded",
		source_selector = {
			winbar = true,
			statusline = false,
		},
		filesystem = { -- for the filesystem tab (the first one)
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			follow_current_file = {
				enabled = true,            -- This will find and focus the file in the active buffer every time
				--              -- the current file is changed while the tree is open.
				leave_dirs_open = true,    -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			},
			bind_to_cwd = true,            -- true creates a 2-way binding between vim's cwd and neo-tree's root
			cwd_target = {
				sidebar = "tab",           -- sidebar is when position = left or right
			},
			hijack_netrw_behavior = "open_default", -- use neo-tree when opening a whole directory in nvim
		},
		buffers = {                        -- for the buffers tab (the second one)
			follow_current_file = {
				enabled = true,            -- This will find and focus the file in the active buffer every time
				--              -- the current file is changed while the tree is open.
				leave_dirs_open = false,   -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
			}
		},

		default_component_configs = {
			-- gruvbox colorscheme messes these up and uses DiagnosticSign<Severity>
			-- just overriding this in gruvbox would cause the Diagnostics in the SignColumn to have the wrong background
			-- this is the easiest fix
			diagnostics = {
				highlights = {
					hint = "DiagnosticHint",
					info = "DiagnosticInfo",
					warn = "DiagnosticWarn",
					error = "DiagnosticError",
				},
			}
		},
	},
	keys = {
		{ "<leader>T", "<cmd>Neotree toggle show<CR>", desc = "Toggle File Explorer Visibility" },
		{
			"<leader>t",
			function()
				if vim.bo.filetype == "neo-tree" then
					vim.cmd.wincmd("p")
				else
					vim.cmd.Neotree("focus")
				end
			end,
			desc = "Toggle File Explorer Focus",
		},
	},
}
