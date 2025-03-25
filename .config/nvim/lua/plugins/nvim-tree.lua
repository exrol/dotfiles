-- NvimTree : Navigation file tree

return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
				git_ignored = false,
			},
		})
	end,
}
