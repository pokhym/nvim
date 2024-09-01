return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	-- Undo this after neovim gets updated to v0.10.0
	tag = "v7.0.0",
	config = function()
		local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        markdown = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
