-- Force comments to be brighter
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Comment", { fg = "#aaaaaa" })
		vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
	end,
})

require("pokhym.core")
-- Run command "Lazy"
require("pokhym.lazy")

-- Setup required for ufo
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
	dynamicRegistration = false,
	lineFoldingOnly = true,
}
