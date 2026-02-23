local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end
return {
	{
		"RedsXDD/neopywal.nvim",
		name = "neopywal",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			vim.cmd.colorscheme("neopywal")
			enable_transparency()
		end,
	},
	"beauwilliams/statusline.lua",
	dependencies = {
		"nvim-lua/lsp-status.nvim",
	},
	config = function()
		require("statusline").setup({
			match_colorscheme = true, -- Enable colorscheme inheritance (Default: false)
			tabline = true, -- Enable the tabline (Default: true)
			lsp_diagnostics = true, -- Enable Native LSP diagnostics (Default: true)
			ale_diagnostics = false, -- Enable ALE diagnostics (Default: false)
		})
	end,
}
