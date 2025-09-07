-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("n", "<M-o>", "<C-^>")

-- copilot
vim.api.nvim_set_keymap("i", "<M-CR>", 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })
vim.g.copilot_no_tab_map = true

vim.keymap.set("n", "<leader>v", ":vsplit<CR>")
vim.keymap.set("n", "<leader>h", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<leader>l", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<leader>j", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<leader>k", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>x", ':lua vim.cmd("close")<CR>')
vim.keymap.set("n", "<M-r>", ":LspRestart<CR>")

vim.keymap.set("n", ";;", "mzA;<Esc>`z", { desc = "Tambah semicolon di akhir baris" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Tambahan keymaps:
vim.keymap.set("n", "<M-s>", ":w<CR>", { desc = "Save file (:w) with Alt+s" })
vim.keymap.set("n", "<M-S-q>", ":q!<CR>", { desc = "Quit without saving (:q!) with Alt+Shift+q" })

-- Pindah buffer
vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { desc = "Buffer sebelumnya" })
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { desc = "Buffer selanjutnya" })

-- Reorder buffer
vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { desc = "Geser buffer ke kiri" })
vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { desc = "Geser buffer ke kanan" })

-- Tutup buffer
vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { desc = "Tutup buffer" })

-- Pick buffer
vim.keymap.set("n", "<A-p>", "<Cmd>BufferPick<CR>", { desc = "Pilih buffer dengan huruf" })

-- Select all dengan "vv"
vim.keymap.set("n", "vv", "ggVG", { desc = "Select all" })

-- Tambah koma di akhir baris dengan ',,'
vim.keymap.set("n", ",,", "mzA,<Esc>`z", { desc = "Tambah koma di akhir baris" })
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- vim: ts=2 sts=2 sw=2 et
