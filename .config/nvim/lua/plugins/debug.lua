return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local dap = require("dap")

			local dapui = require("dapui")
			local daptext = require("nvim-dap-virtual-text")

			dapui.setup()
			daptext.setup()

			-- Debugger engine / configuration
			local adapters = require("config.debug.adaptaters")
			local configuration = require("config.debug.configuration")
			dap.adapters.php = adapters
			dap.configurations = configuration

			-- Debugger UI
			-- Automatically open the UI when starting the debugger
			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			-- Automatically close the UI when the debugger terminates
			dap.listeners.after.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.after.event_exited.dapui_config = function()
				dapui.close()
			end

			local sign = vim.fn.sign_define

			sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
			sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
			sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
			sign("DapStopped", { text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })

			-- Debugger extension
		end,
	},
}
