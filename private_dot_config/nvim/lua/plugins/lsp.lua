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
			-- implicitly calls the `require("mason-lspconfig,).setup(_, opts)`-function.
			-- this is done before the `require("nvim-lspconfig").setup(…)`-function, as `mason-lspconfig` is a dependency
			-- this works well for the `ensure_installed`-option,
			-- however the `handlers`-option needs to be done below (see `config`-function of nvim-lspconfig),
			-- because it must be done after the `require("lsp-zero").setup(…)`.
			opts = {
				ensure_installed = {
					"clangd", --C and C++
					"cmake", --CMake
					-- "jsonls", --JSON TODO
					"texlab", --LaTeX
					"lua_ls", --Lua
					"autotools_ls", --makefiles
					"markdown_oxide", --Markdown (mayber try others)
					"pylsp", --Python
					"rust_analyzer", --Rust
					"taplo", --TOML
				},
			}
		},
		-- provides some great defaults, e.g., keymappings etc.
		{ 'VonHeikemen/lsp-zero.nvim',    branch = 'v3.x' },
		-- for asynchronous format-on-save
		{ "lukas-reineke/lsp-format.nvim" }
	},

	config = function()
		-- TODO: what else can lsp_zero do for me?
		local lsp_zero = require('lsp-zero')

		lsp_zero.on_attach(function(client, bufnr)
			-- use lsp-zero’s default keybindings
			lsp_zero.default_keymaps({
				buffer = bufnr,
				preserve_mappings = false
			})

			-- enable asynchronous formatting-on-save
			-- assumes that only one language server is attached to any one buffer
			if client.supports_method('textDocument/formatting') then
				require('lsp-format').on_attach(client)
			end
		end)

		-- Font-Awesome (https://github.com/FortAwesome/Font-Awesome) icons for consistency
		lsp_zero.set_sign_icons({
			error = '',
			warn = '',
			hint = '',
			info = ''
		})

		-- must come after lsp_zero
		require('mason-lspconfig').setup({
			handlers = {
				-- default setup for all language servers
				function(server_name)
					require('lspconfig')[server_name].setup({})
				end,
				-- if a specific language server needs special configuration, proceed as follows:
				-- ```
				-- example_server = function()
				-- -- special setup (if needed), usually it’s just:
				--	require('lspconfig').example_server.setup({
				--		-- custom parameters
				--	})
				-- end
				-- ```
			},
		})
	end,
}
