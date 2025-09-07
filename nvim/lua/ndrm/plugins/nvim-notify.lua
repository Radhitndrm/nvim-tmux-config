return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")
		vim.notify = notify

		notify.setup({
			stages = "slide",
			timeout = 2000,
			top_down = true,
			minimum_width = 20,
			background_colour = "#1e1e2e",
			icons = {
				ERROR = "",
				WARN = "",
				INFO = "",
				DEBUG = "",
				TRACE = "✎",
			},
			on_open = function(win)
				local width = vim.api.nvim_win_get_width(win)
				local col = math.floor((vim.o.columns - width) / 2)
				local row = vim.api.nvim_win_get_config(win).row or 2
				vim.api.nvim_win_set_config(win, {
					relative = "editor",
					row = row,
					col = col,
				})
			end,
		})

		-- Terapkan highlight sesuai palet Lackluster
		vim.cmd([[
			hi NotifyERRORBorder guifg=#e06c75
			hi NotifyERRORIcon   guifg=#e06c75
			hi NotifyERRORTitle  guifg=#e06c75

			hi NotifyWARNBorder guifg=#e5c07b
			hi NotifyWARNIcon   guifg=#e5c07b
			hi NotifyWARNTitle  guifg=#e5c07b

			hi NotifyINFOBorder guifg=#5c6a82
			hi NotifyINFOIcon   guifg=#5c6a82
			hi NotifyINFOTitle  guifg=#5c6a82

			hi NotifyDEBUGBorder guifg=#444444
			hi NotifyDEBUGIcon   guifg=#444444
			hi NotifyDEBUGTitle  guifg=#444444

			hi NotifyTRACEBorder guifg=#2f3545
			hi NotifyTRACEIcon   guifg=#2f3545
			hi NotifyTRACETitle  guifg=#2f3545
		]])

		-- Helper function
		local function safe_notify(msg, level, title)
			vim.defer_fn(function()
				vim.notify(msg, level, { title = title, timeout = 1500 })
			end, 10)
		end

		-- Autocommands
		local events = {
			{
				event = "TextYankPost",
				msg = function()
					local lines = vim.fn.line("'>") - vim.fn.line("'<") + 1
					return lines .. (lines > 1 and " lines yanked" or " line yanked")
				end,
				title = "Yank",
			},
			{ event = "BufWritePost", msg = "File saved", title = "Save" },
			{ event = "BufReadPost", msg = "File opened ", title = "Open" },
			{ event = "InsertEnter", msg = "Insert  Mode", title = "Mode" },
			{ event = "InsertLeave", msg = "Normal Mode", title = "Mode" },
			{ event = "BufNewFile", msg = "New file created ", title = "New File" },
			{ event = "QuickFixCmdPost", msg = "Quickfix executed 🔧", title = "QuickFix" },
		}

		for _, e in ipairs(events) do
			vim.api.nvim_create_autocmd(e.event, {
				callback = function()
					local msg = type(e.msg) == "function" and e.msg() or e.msg
					safe_notify(msg, vim.log.levels.INFO, e.title)
				end,
			})
		end
	end,
}
