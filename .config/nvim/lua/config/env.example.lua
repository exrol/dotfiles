return {
	debug = {
		php = {
			pathMappings = {
				[""] = "", -- Docker php debug [Container path] = local path of php project to debug
			},
			phpAdapterPath = "", -- Path to phpAdapter ex: $HOME/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js
		},
	},
}
