return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			-- installs and manages language servers
			'williamboman/mason.nvim',
			-- Lazy only calls `require("mason").setup(…)` if opts = true, or the config function is defined.
			-- config = true just means call the default implementation, namely `require(MAIN).setup(opts)`.
			config = true,
		},
		{
			-- TODO can this install all neded lsps automatically?
			"williamboman/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"clangd", --C and C++
					"cmake", --CMake
					-- "jsonls", --JSON TODO
					"texlab", --LaTeX
					"lua_ls", --Lua
					"autotools_ls", --makefiles
					"markdown_oxide", --Markdown (mayber try others)
					-- "pyright", --Python TODO
					"rust_analyzer", --Rust
					"taplo", --TOML
				},
			}
		},
		{
			-- provides some great defaults, e.g., keymappings etc.
			'VonHeikemen/lsp-zero.nvim',
			branch = 'v3.x'
		}
	},

	config = function()
		-- TODO: what else can lsp_zero do for me?
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			lsp_zero.default_keymaps({
				buffer = bufnr,
				preserve_mappings = false
			})
		end)

		local lspconfig = require("lspconfig")
		-- TODO: can these be automated (dont want to activate each ls separately (only at buffer-attatch?)
		lspconfig.lua_ls.setup({})
	end,
}
