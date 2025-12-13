return {
	"CopilotC-Nvim/CopilotChat.nvim",
	branch = "main",
	cmd = "CopilotChat",
	opts = function()
		local user = vim.env.USER or "User"
		user = user:sub(1, 1):upper() .. user:sub(2)

		return {
			auto_insert_mode = true,
			question_header = "  " .. user .. " ",
			answer_header = "  Copilot ",
			window = {
				width = 0.4,
			},

			allow_insecure_commands = true,

			mappings = {
				-- Completion
				complete = {
					detail = "Use @<Tab> or /<Tab> for options.",
					insert = "<Tab>",
				},

				-- Close chat
				close = {
					normal = "q",
					insert = "<C-c>",
				},

				-- Reset chat buffer
				reset = {
					normal = "<C-x>",
					insert = "<C-x>",
				},

				-- Submit prompt
				submit_prompt = {
					normal = "<CR>",
					insert = "<C-CR>",
				},

				-- Accept diff
				accept_diff = {
					normal = "<C-y>",
					insert = "<C-y>",
				},

				-- Yank diff
				yank_diff = {
					normal = "gmy",
				},

				-- Show diff
				show_diff = {
					normal = "gmd",
				},

				-- Show info
				show_info = {
					normal = "gmi",
				},

				-- Show context
				show_context = {
					normal = "gmc",
				},

				-- Show help
				show_help = {
					normal = "gmh",
				},
			},
		}
	end,

	keys = {
		{ "<c-s>", "<CR>", ft = "copilot-chat", desc = "Submit Prompt", remap = true },

		-- Toggle chat
		{
			"<leader>aa",
			function()
				return require("CopilotChat").toggle()
			end,
			desc = "Toggle CopilotChat",
			mode = { "n", "v" },
		},

		-- Clear chat
		{
			"<leader>ax",
			function()
				return require("CopilotChat").reset()
			end,
			desc = "Clear CopilotChat",
			mode = { "n", "v" },
		},

		-- Quick Chat
		{
			"<leader>aq",
			function()
				local input = vim.fn.input("Quick Chat: ")
				if input ~= "" then
					require("CopilotChat").ask(input)
				end
			end,
			desc = "Quick Chat (CopilotChat)",
			mode = { "n", "v" },
		},

		-- Prompt actions
		{
			"<leader>ap",
			function()
				local actions = require("CopilotChat.actions")
				require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
			end,
			desc = "CopilotChat - Prompt actions",
		},

		-- Prompt actions (visual mode)
		{
			"<leader>ap",
			":lua require('CopilotChat.integrations.telescope').pick(require('CopilotChat.actions').prompt_actions({selection = require('CopilotChat.select').visual}))<CR>",
			mode = "x",
			desc = "CopilotChat - Prompt actions (visual)",
		},

		-- 🔥 Run selected command in terminal
		{
			"<leader>ar",
			function()
				require("CopilotChat").ask("Run this command in a terminal", { selection = true })
			end,
			desc = "Copilot: Run selected command in terminal",
			mode = "v",
		},

		-- 🔥 Open Copilot terminal manually
		{
			"<leader>at",
			function()
				require("CopilotChat.integrations.fzf").run_terminal()
			end,
			desc = "Copilot: Open Terminal",
			mode = "n",
		},
	},

	config = function(_, opts)
		local chat = require("CopilotChat")

		-- Nonaktifkan line numbers khusus untuk jendela chat
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = "copilot-chat",
			callback = function()
				vim.opt_local.relativenumber = false
				vim.opt_local.number = false
			end,
		})

		chat.setup(opts)
	end,
}
