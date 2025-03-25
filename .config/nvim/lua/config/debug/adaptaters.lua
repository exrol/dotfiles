-- DAP configuration

local phpAdapterPath = require("config.env").debug.php.phpAdapterPath

return {
	php = {
		type = "executable",
		command = "node",
		args = { phpAdapterPath },
	},
}
