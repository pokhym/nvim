-- Fuzzy finder
return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						-- Ctrl + kjq
						-- Ctrl + kj moves
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						-- Pressing tab will send it to a quick fix list when the window is open
						-- Send selected items to quick fix list
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				-- -- Use grep wihtout rg dependency
				-- vimgrep_arguments = {
				-- 	"grep",
				-- 	"--extended-regexp",
				-- 	"--color=never",
				-- 	"--with-filename",
				-- 	"--line-number",
				-- 	"-b", -- grep doesn't support a `--column` option :(
				-- 	"--ignore-case",
				-- 	"--recursive",
				-- 	"--no-messages",
				-- 	"--exclude-dir=*cache*",
				-- 	"--exclude-dir=*.git",
				-- 	"--exclude=.*",
				-- 	"--binary-files=without-match"
				-- },
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		keymap.set(
			"n",
			"<leader>fb",
			"<cmd>Telescope current_buffer_fuzzy_find<cr>",
			{ desc = "Find string in current buffer" }
		)
	end,
}
