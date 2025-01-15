-- make comma the leader key
vim.g.mapleader = ","
vim.g.maplocalleader = "."

local keymap = vim.keymap

-- Clear highlights after a search
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights in normal mode " })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Copy paths
keymap.set("n", "<leader>pr", '<cmd>let @+ = expand("%")<CR>', { desc = "Copy relative path to unnamed register" })
keymap.set("n", "<leader>pf", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy full path to unnamed register" })
keymap.set("n", "<leader>pn", '<cmd>let @+ = expand("%:t")<CR>', { desc = "Copy filename to unnamed register" })

-- Start grug
keymap.set("n", "<leader>gr", "<cmd>GrugFar<CR>", { desc = "Start GrugFar" })

-- FIXME: Double clicking it still pastes??
-- Disable middle mouse paste
-- https://neovim.io/doc/user/change.html
-- :map <MiddleMouse> <Nop>
-- :imap <MiddleMouse> <Nop>
keymap.set("n", "<MiddleMouse>", "<Nop>", { desc = "Disable middle mouse button" })
keymap.set("i", "<MiddleMouse>", "<Nop>", { desc = "Disable middle mouse button" })
keymap.set("v", "<MiddleMouse>", "<Nop>", { desc = "Disable middle mouse button" })
