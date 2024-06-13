return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	lazy = true,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	opts = function()
		return {
			defaults = {
				winblend = vim.o.winblend,
				mappings = {
					i = {
						["<Esc>"] = "close",
						["<C-?>"] = "which_key",
						["<C-l>"] = "preview_scrolling_up",
						["<C-a>"] = "preview_scrolling_down",
					},
				},
			},
			extensions = {
				fzf = {},
				-- shows code actions in little popup-window
				["ui-select"] = {
					require("telescope.themes").get_dropdown {
						-- even more opts
					}
				},
			},
			pickers = {
				find_files = {
					-- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
					find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
				},
			}
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
	end,
	keys = function()
		local builtin = require("telescope.builtin")
		return {
			{ "<leader>fb", builtin.buffers,     desc = "Find Buffers" },
			{ "<leader>ff", builtin.find_files,  desc = "Find Files" },
			{ "<leader>fg", builtin.live_grep,   desc = "Find Grep" },
			{ "<leader>fc", builtin.colorscheme, desc = "Find Colorschemes" },
			{ "<leader>f?", builtin.keymaps,     desc = "Vim custom normal mode keymaps" },
		}
	end,
}
