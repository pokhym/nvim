return {
	"LintaoAmons/scratch.nvim",
	dependencies = {
		{ "ibhagwan/fzf-lua" }, --optional: if you want to use fzf-lua to pick scratch file. Recommanded, since it will order the files by modification datetime desc. (require rg)
		{ "nvim-telescope/telescope.nvim" }, -- optional: if you want to pick scratch file by telescope
		{ "stevearc/dressing.nvim" }, -- optional: to have the same UI shown in the GIF
	},
	-- branch = "dev",
	-- dir = "/Volumes/t7ex/Documents/oatnil/release/scratch.nvim",
	config = function()
		require("scratch").setup({
			scratch_file_dir = vim.fn.stdpath("cache") .. "/scratch.nvim", -- where your scratch files will be put
			filetypes = { "txt", "c", "cpp", "py", "sh", "md", "nim" }, -- you can simply put filetype here
			filetype_details = { -- or, you can have more control here
				json = {}, -- empty table is fine
				["project-name.md"] = {
					subdir = "project-name", -- group scratch files under specific sub folder
				},
				["yaml"] = {},
				go = {
					requireDir = true, -- true if each scratch file requires a new directory
					filename = "main", -- the filename of the scratch file in the new directory
					content = { "package main", "", "func main() {", "  ", "}" },
					cursor = {
						location = { 4, 2 },
						insert_mode = true,
					},
				},
			},
			window_cmd = "edit", -- 'vsplit' | 'split' | 'edit' | 'tabedit' | 'rightbelow vsplit'
			file_picker = "fzflua",
			localKeys = {
				{
					filenameContains = { "sh" },
					LocalKeys = {
						{
							cmd = "<CMD>RunShellCurrentLine<CR>",
							key = "<C-r>",
							modes = { "n", "i", "v" },
						},
					},
				},
			},
		})
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<M-C-n>",
		-- 	"<cmd>Scratch<cr>",
		-- 	{ desc = "Creates a new scratch file in the specified scratch_file_dir " }
		-- )
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<M-C-N>",
		-- 	"<cmd>ScratchWithName<cr>",
		-- 	{ desc = "Creates a new scratch file of a name in the specified scratch_file_dir " }
		-- )
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<M-C-o>",
		-- 	"<cmd>ScratchOpen<cr>",
		-- 	{ desc = "Opens an existing scratch file from the scratch_file_dir" }
		-- )
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<M-C-f>",
		-- 	"<cmd>ScratchOpenFzf<cr>",
		-- 	{ desc = "Uses fuzzy finding to search through the contents of scratch files and open a selected file." }
		-- )
	end,
	event = "VeryLazy",
}
