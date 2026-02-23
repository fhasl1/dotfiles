require("flash").toggle()
require("oil").setup()
require("mini.indentscope").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("mason-nvim-dap").setup()

vim.lsp.enable("cpp, luals, html, bash, css, c")

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "Lsp: " .. desc })
		end
		map("K", vim.lsp.buf.hover, "hover")
		map("<leader>E", vim.diagnostic.open_float, "diagnostic")
		map("<leader>k", vim.lsp.buf.signature_help, "sig help")
		map("<leader>rn", vim.lsp.buf.rename, "rename")
		map("<leader>ca", vim.lsp.buf.code_action, "code action")
		map("<leader>wf", vim.lsp.buf.format, "format")

		vim.keymap.set("v", "<leader>ca", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Lsp: code_action" })

		local dap = require("dap")
		map("<leader>dt", dap.toggle_breakpoint, "Toggle Break")
		map("<leader>dc", dap.continue, "Continue")
		map("<leader>dr", dap.repl.open, "Inspect")
		map("<leader>dk", dap.terminate, "Kill")

		map("<leader>dso", dap.step_over, "Step Over")
		map("<leader>dsi", dap.step_into, "Step Into")
		map("<leader>dsu", dap.step_out, "Step Out")
		map("<leader>dl", dap.run_last, "Run Last")

		local dapui = require("dapui")
		map("<leader>duu", dapui.open, "open ui")
		map("<leader>duc", dapui.close, "open ui")
	end,
})

require("mason-nvim-dap").setup({
	ensure_installed = { "cppdbg" },
	automatic_installation = true,
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})

local cmp = require("cmp")
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{
			name = "path",
			option = {
				pathMappings = {
					["@"] = "${folder}/src",
					-- ['/'] = '${folder}/src/public/',
					-- ['~@'] = '${folder}/src',
					-- ['/images'] = '${folder}/src/images',
					-- ['/components'] = '${folder}/src/components',
				},
			},
		},
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'luasnip' },   -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
require("luasnip.loaders.from_vscode").lazy_load()

vim.cmd.colorscheme("neopywal")
require("statusline").setup({
	match_colorscheme = true, -- Enable colorscheme matching (Default: false)
})

vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Format before save",
	pattern = "*",
	group = vim.api.nvim_create_augroup("FormatConfig", { clear = true }),
	callback = function(ev)
		local conform_opts = { bufnr = ev.buf, lsp_format = "fallback", timeout_ms = 2000 }
		local client = vim.lsp.get_clients({ name = "ts_ls", bufnr = ev.buf })[1]

		if not client then
			require("conform").format(conform_opts)
			return
		end

		local request_result = client:request_sync("workspace/executeCommand", {
			command = "_typescript.organizeImports",
			arguments = { vim.api.nvim_buf_get_name(ev.buf) },
		})

		if request_result and request_result.err then
			vim.notify(request_result.err.message, vim.log.levels.ERROR)
			return
		end

		require("conform").format(conform_opts)
	end,
})
