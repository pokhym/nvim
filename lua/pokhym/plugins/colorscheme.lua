return {
	-- "shaunsingh/moonlight.nvim",
	-- -- High priority makes it load first
	-- priority = 1000,
	-- config = function()
	--   vim.cmd("colorscheme moonlight")
	-- end
	-- "scottmckendry/cyberdream.nvim",
	-- priority = 1000,
	-- config = function()
	--   vim.cmd("colorscheme cyberdream")
	-- end
	"maxmx03/fluoromachine.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local fm = require("fluoromachine")

		fm.setup({
			glow = true,
			theme = "fluoromachine",
			-- theme = "retrowave",
			-- theme = "delta",
			transparent = true,
		})

		vim.cmd.colorscheme("fluoromachine")
	end,
}
