-- LSP CONFIGURATION

return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspConfig = require("lspconfig")
		lspConfig.ts_ls.setup({})
		lspConfig.cssls.setup({})
		lspConfig.eslint.setup({})
		lspConfig.pyright.setup({})
		lspConfig.lua_ls.setup({})
	end,
}
