-- Configuration keymaps :

-- Generic vim keymap function / default option
local opts = { noremap = true, silent = true }
local set = vim.keymap.set

-- Telescope searches ( File / commands )
local telescope_builtin = require("telescope.builtin")
set("n", "<leader>ff", telescope_builtin.find_files, opts)
set("n", "<leader>fg", telescope_builtin.live_grep, opts)
set("n", "<leader>fb", telescope_builtin.buffers, opts)

-- Toggle helpers / menu / widgets
set("n", "<leader>t", ":NvimTreeFindFileToggle<CR>", opts) -- ( File tree explorer )
set("n", "<leader>at", ":Alpha<CR>", opts) -- ( Alpha greeter )

-- Navigation helpers
-- Cycle through errors
set("n", "<leader>n", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
set("n", "<leader>p", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)

-- DAP
-- Debug Navigation
vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F10>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F11>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F12>", function()
	require("dap").step_out()
end)

-- Toggle breakpoint
vim.keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)

-- Toggle dapui
vim.keymap.set("n", "<Leader>ui", function()
	require("dapui").toggle()
end)
