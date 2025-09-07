-- File: ndrm/plugins/legendary.lua
return {
	"mrjones2014/legendary.nvim",
	config = function()
		local legendary = require("legendary")

		local keymaps = {
			-- 1. Jendela
			{ "Space + h", "<C-w><C-h>", description = "Pindah ke jendela kiri", mode = "n" },
			{ "Space + l", "<C-w><C-l>", description = "Pindah ke jendela kanan", mode = "n" },
			{ "Space j", "<C-w><C-j>", description = "Pindah ke jendela bawah", mode = "n" },
			{ "Space + k", "<C-w><C-k>", description = "Pindah ke jendela atas", mode = "n" },
			{ "Space v", ":vsplit<CR>", description = "Buka jendela vertikal baru", mode = "n" },
			{ "Space x", ":close<CR>", description = "Tutup jendela saat ini", mode = "n" },
			{ "Space + e", ":Neotree toggle<CR>", description = "Buka / tutup Neotree", mode = "n" },

			-- 2. File
			{ "Alt + ,", "<Cmd>BufferPrevious<CR>", description = "Pindah ke buffer sebelumnya", mode = "n" },
			{ "Alt + .", "<Cmd>BufferNext<CR>", description = "Pindah ke buffer berikutnya", mode = "n" },
			{ "Alt + <", "<Cmd>BufferMovePrevious<CR>", description = "Geser buffer ke kiri", mode = "n" },
			{ "Alt + >", "<Cmd>BufferMoveNext<CR>", description = "Geser buffer ke kanan", mode = "n" },
			{ "Alt + c", "<Cmd>BufferClose<CR>", description = "Tutup buffer saat ini", mode = "n" },
			{ "Alt + p", "<Cmd>BufferPick<CR>", description = "Pilih buffer dengan huruf", mode = "n" },
			{ "Ctrl + p", ":Telescope find_files<CR>", description = "Cari file dengan Telescope", mode = "n" },
			{ "Alt + s", ":w<CR>", description = "Simpan file", mode = "n" },
			{ "Alt + Shift + q", ":q!<CR>", description = "Keluar dari nvim ", mode = "n" },
			{ "Alt + o", "<C-^>", description = "Beralih ke file sebelumnya", mode = "n" },

			-- 3. LSP
			{ "Alt + r", ":LspRestart<CR>", description = "Restart LSP", mode = "n" },

			-- 4. Gerak / Scroll
			{ "h", "h", description = "Gerak ke kiri", mode = { "n", "v" } },
			{ "j", "j", description = "Gerak ke bawah", mode = { "n", "v" } },
			{ "k", "k", description = "Gerak ke atas", mode = { "n", "v" } },
			{ "l", "l", description = "Gerak ke kanan", mode = { "n", "v" } },
			{ "$", "$", description = "Pindah ke akhir baris", mode = { "n", "v" } },
			{ "%", "%", description = "Melompat ke pasangan kurung/kurawal", mode = { "n", "v" } },
			{ "#", "#", description = "Cari kata di bawah kursor ke belakang", mode = "n" },

			-- 5. Masuk / Tambah teks
			{ "a", "a", description = "Masuk mode insert setelah kursor", mode = "n" },
			{ "i", "i", description = "Masuk mode insert sebelum kursor", mode = "n" },
			{ "A", "A", description = "Masuk mode insert di akhir baris", mode = "n" },
			{ "I", "I", description = "Masuk mode insert di awal baris", mode = "n" },

			-- 6. Salin / Hapus / Tempel
			{ "Space + p", [["_dP]], description = "Tempel tanpa menimpa clipboard", mode = { "x", "v" } },
			{ "Space + y", [["+y]], description = "Salin ke clipboard", mode = { "n", "v" } },
			{ "Space + Y", [["+Y]], description = "Salin seluruh baris ke clipboard", mode = "n" },
			{ "Space + d", [["_d]], description = "Hapus tanpa menimpa clipboard", mode = { "n", "v" } },

			-- 7. Visual mode dasar + seleksi
			{ "y", "y", description = "Salin pilihan", mode = "v" },
			{ "Y", "Y", description = "Salin baris pilihan", mode = "v" },
			{ "p", "p", description = "Tempel pilihan setelah kursor", mode = "v" },
			{ "P", "P", description = "Tempel pilihan sebelum kursor", mode = "v" },
			{ "ggVG", "ggVG", description = "Pilih seluruh buffer", mode = "v" },
			{ "Vj", "Vj", description = "Pilih baris berikutnya", mode = "v" },
			{ "Vk", "Vk", description = "Pilih baris sebelumnya", mode = "v" },
			{ "VJ", "VJ", description = "Gabungkan baris visual ke bawah", mode = "v" },

			-- 8. Text objects / manipulasi kata
			{ "yiw", "yiw", description = "Salin kata di dalam (inner word)", mode = { "n", "v" } },
			{ "ciw", "ciw", description = "Ganti kata di dalam (inner word)", mode = "n" },
			{ "diw", "diw", description = "Hapus kata di dalam (inner word)", mode = "n" },
			{ "cit", "cit", description = "Ganti isi tag", mode = "n" },
			{ "ci(", "ci(", description = "Ganti isi kurung", mode = "n" },
			{ "ci)", "ci)", description = "Ganti isi kurung", mode = "n" },
			{ "ci[", "ci[", description = "Ganti isi bracket", mode = "n" },
			{ "ci]", "ci]", description = "Ganti isi bracket", mode = "n" },
			{ "yyp", "yyp", description = "Duplikasi baris", mode = "n" },

			-- 9. Motion tambahan / lainnya
			{ "J", "mzJ`z", description = "Gabungkan baris saat ini dengan baris berikut", mode = "n" },
			{ "Ctrl + d", "<C-d>zz", description = "Scroll ke bawah dan fokus di tengah layar", mode = "n" },
			{ "Ctrl + u", "<C-u>zz", description = "Scroll ke atas dan fokus di tengah layar", mode = "n" },
			{ "n", "nzzzv", description = "Cari berikutnya dan fokus di tengah layar", mode = "n" },
			{ "N", "Nzzzv", description = "Cari sebelumnya dan fokus di tengah layar", mode = "n" },

			-- 10. Mode insert
			{ "jj", "<Esc>", description = "Keluar dari mode insert", mode = "i" },
			{
				"Alt + Enter",
				'copilot#Accept("<CR>")',
				description = "Terima saran Copilot",
				mode = "i",
				opts = { expr = true, noremap = true, silent = true },
			},

			-- 11. Miscellaneous / lain-lain
			{ ";;", "mzA;<Esc>`z", description = "Tambahkan titik koma di akhir baris", mode = "n" },

			-- 12. Barbar
		}

		legendary.setup({
			keymaps = keymaps,
			opts = { select_prompt = "Pilih shortcut: " },
			include_builtin = false,
			include_legendary = false,
		})

		vim.keymap.set("n", "<A-H>", function()
			legendary.find({ sources = { "keymaps" } })
		end, { desc = "Tampilkan semua shortcut yang didefinisikan sendiri" })
	end,
}
