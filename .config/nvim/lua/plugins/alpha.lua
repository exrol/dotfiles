return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local header = {}
		local offsetLine = "                                                     "
		local function appendOffsetLine(tableObject, number)
			for i = 0, number, 1 do
				table.insert(tableObject, offsetLine)
			end
		end
		local function appendMenuDivider(tableObject)
			local divider = "-----------------------------------------"
			table.insert(tableObject, divider)
		end
		local function appendLines(tableObject, lines)
			for i, line in pairs(lines) do
				table.insert(tableObject, line)
			end
		end
		local title = {
			"  ▒▒▒╗   ▒▒╗▒▒▒▒▒▒▒╗ ▒▒▒▒▒▒╗ ▒▒╗   ▒▒╗▒▒╗▒▒▒╗   ▒▒▒╗ ",
			"  ▒▒▒▒╗  ▒▒║▒▒╔════╝▒▒╔═══▒▒╗▒▒║   ▒▒║▒▒║▒▒▒▒╗ ▒▒▒▒║ ",
			"  ▒▒╔▒▒╗ ▒▒║▒▒▒▒▒╗  ▒▒║   ▒▒║▒▒║   ▒▒║▒▒║▒▒╔▒▒▒▒╔▒▒║ ",
			"  ▒▒║╚▒▒╗▒▒║▒▒╔══╝  ▒▒║   ▒▒║╚▒▒╗ ▒▒╔╝▒▒║▒▒║╚▒▒╔╝▒▒║ ",
			"  ▒▒║ ╚▒▒▒▒║▒▒▒▒▒▒▒╗╚▒▒▒▒▒▒╔╝ ╚▒▒▒▒╔╝ ▒▒║▒▒║ ╚═╝ ▒▒║ ",
			"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
			"  ________________________ ネオビム の エクスロル __ ",
		}
		-- Set header
		appendOffsetLine(header, 1)
		appendLines(header, title)
		table.insert(header, offsetLine)
		appendOffsetLine(header, 3)

		dashboard.section.header.val = header
		local todolistPath = "~/.config/nvim/lua/config/todolist.lua"
		local notesPath = "~/.config/nvim/lua/config/notes"

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("-", "- - - - - - - - - - - - - - - - - - - - - - - - - ", ""),
			dashboard.button("e", "  > New file / 新規ファイル", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  > Find file / ファイルを検索", ":Telescope find_files<CR>"),
			dashboard.button("r", "  > Recent / 最近のファイル", ":Telescope oldfiles<CR>"),
			dashboard.button("t", "  > Todolist / トゥードゥーリスト", ":e " .. todolistPath .. " <CR>"),
			dashboard.button("n", "  > Notes / ...", ":e " .. notesPath .. " <CR>"),
			dashboard.button("-", "- - - - - - - - - - - - - - - - - - - - - - - - - ", ""),
			dashboard.button("s", "  > Settings / 設定", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			dashboard.button("q", "  > Quit NVIM / 終了", ":qa<CR>"),
			dashboard.button("-", "- - - - - - - - - - - - - - - - - - - - - - - - - ", ""),
		}

		local listHeader = {
			" ╭── Todolist / トゥードゥーリスト ────────────────────╮ ",
			" │                                                     │ ",
		}
		local listFooter = {
			" │                                                     │ ",
			" ╰─────────────────────────────────────────────────────╯ ",
		}

		local limit = 46
		local maxItems = 5

		-- see if the file exists
		local function file_exists(file)
			local f = io.open(file, "rb")
			if f then
				f:close()
			end
			return f ~= nil
		end

		local function lines_from(file)
			if not file_exists(file) then
				return require("config.todolist")
			end
			local lines = {}
			for line in io.lines(file) do
				lines[#lines + 1] = line
			end
			return lines
		end

		-- tests the functions above
		local file = "todolist"
		local list = lines_from(file)

		local lines = {}
		local count = 0
		-- Format todo lines
		for i, line in pairs(list) do
			count = count + 1
			local value
			-- String truncated if limit reached
			if string.len(line) > limit then
				value = string.sub(line, 0, limit - 2) .. "..."
			else
				value = string.sub(line, 0, limit)
				-- Add offset
				for i = 1, limit - string.len(value) + 1 do
					value = value .. " "
				end
			end
			local prefix = " │   • "
			local suffix = " │ "
			value = prefix .. value .. suffix
			if i < maxItems then
				table.insert(lines, value)
			end
		end

		local footer = {}
		appendOffsetLine(footer, 5)
		if count ~= 0 then
			appendLines(footer, listHeader)
			appendLines(footer, lines)
			appendLines(footer, listFooter)
		end
		appendOffsetLine(footer, 1)
		dashboard.section.footer.val = footer
		alpha.setup(dashboard.opts)
	end,
}
