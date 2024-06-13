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
		{ "lukas-reineke/lsp-format.nvim" },

		-- autocompletion tool
		{
			'hrsh7th/nvim-cmp',
			dependencies = {
				--  nvim-cmp source for neovim builtin LSP client (i.e, cmp could not use lsp-completion if this wasn’t installed)
				'hrsh7th/cmp-nvim-lsp',
				--  nvim-cmp source for words in the active buffers
				'hrsh7th/cmp-buffer',
				-- nvim-cmp source for file system paths
				'hrsh7th/cmp-path',
				-- nvim-cmp source for vimtex, especially helpful for citekeys
				"micangl/cmp-vimtex",
			},
			-- configuration for cmp
			opts = function()
				local cmp = require('cmp')
				local defaults = require("cmp.config.default")()
				local cmp_format = require('lsp-zero').cmp_format({ details = true })

				return {
					-- add all kinds of sources to the autocompletion
					-- TODO: add sources for luasnip, filesystem paths, command line, emojis, nerdfonts, latex_symbols, (maybe) AI, neovims-lua-API, …
					sources = {
						{ name = 'nvim_lsp' },
						{ name = 'buffer' },
						{ name = 'path' },
						{ name = 'vimtex' },
					},
					--- Show source name in completion menu
					formatting = cmp_format,
					mapping = {
						-- there is a “safely select entries with <CR>”-section in the cmp-docs
						-- if you ever run into problems in select- or visual-mode, consult https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#safely-select-entries-with-cr
						-- ["<CR>"] = cmp.mapping({
						-- 	i = function(fallback)
						-- 		if cmp.visible() and cmp.get_active_entry() then
						-- 			cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						-- 		else
						-- 			fallback()
						-- 		end
						-- 	end,
						-- 	s = cmp.mapping.confirm({ select = true }),
						-- 	c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
						-- }),
						['<CR>'] = cmp.mapping.confirm({ select = false }),
						['<Esc>'] = cmp.mapping.abort(),
						['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
						['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
						-- trigger completion menu manually
						['<C-Space>'] = cmp.mapping.complete(),
						-- TODO: specify behavior for <TAB> in the context of LuaSnip-completion
					},
				}
			end,
		},
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


		-- TODO: For some reasons doesnt work
		-- see: https://github.com/hrsh7th/nvim-cmp/issues/715#issuecomment-1937158748
		-- add small delay before showing cmp autocompletion window
		--local completionDelay = 1750
		--local timer = nil
		--local cmp = require("cmp")

		--function _G.setAutoCompleteDelay(delay)
		--	completionDelay = delay
		--end

		--function _G.getAutoCompleteDelay()
		--	return completionDelay
		--end

		--vim.api.nvim_create_autocmd({ "TextChangedI", "CmdlineChanged" }, {
		--	pattern = "*",
		--	callback = function()
		--		if timer then
		--			vim.loop.timer_stop(timer)
		--			timer = nil
		--		end

		--		timer = vim.loop.new_timer()
		--		timer:start(
		--			_G.getAutoCompleteDelay(),
		--			0,
		--			vim.schedule_wrap(function()
		--				cmp.complete({ reason = cmp.ContextReason.Auto })
		--			end)
		--		)
		--	end,
		--})
	end,
}
