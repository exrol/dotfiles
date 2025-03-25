-- Debug global configuration

local pathMappings = require("config.env").debug.php.pathMappings

return {
	php = {
		{
			request = "launch",
			name = "Listen for Xdebug",
			stopOnEntry = false,
			port = 9003,
			type = "php",
			pathMappings,
		},
	},
}
