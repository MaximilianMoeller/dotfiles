return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	-- load on startup so it can display recent files
	lazy = false,
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		{
			"ahmedkhalf/project.nvim",
			-- the `require`-call in the `config`-function (implied by setting `opts`), needs to use 'project_nvim' instead of 'project'
			name = "project_nvim",
			opts = {
				-- everything that has a `.git` subdirectory or is located in ~projects is usually a project
				patterns = { ".git", ">~/projects" },
				show_hidden = true,
			}
		}
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
		telescope.load_extension("projects")
	end,
	keys = function()
		local builtin = require("telescope.builtin")
		local extensions = require("telescope").extensions
		return {
			{ "<leader>fb", builtin.buffers,              desc = "Find Buffers" },
			{ "<leader>ff", builtin.find_files,           desc = "Find Files" },
			{ "<leader>fg", builtin.live_grep,            desc = "Find Grep" },
			{ "<leader>fp", extensions.projects.projects, desc = "Find Projects" },
			{ "<leader>fc", builtin.colorscheme,          desc = "Find Colorschemes" },
			{ "<leader>f?", builtin.keymaps,              desc = "Vim custom normal mode keymaps" },
		}
	end,
}
