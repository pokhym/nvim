-- tree directory
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- relative number in lines
opt.relativenumber = true
-- show current line number
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tabs into spaces
opt.autoindent = true -- next line uses same indent

-- disable line wrap
opt.wrap = false

-- case insensitive search by default
opt.ignorecase = true
-- but if mixed case in the search term will be case sensitive
opt.smartcase = truewa

-- underlines current line
opt.cursorline = true

opt.termguicolors = true
-- Force dark mode if possible
opt.background = "dark"
opt.signcolumn = "yes"

-- allow backspace on indent, end of line or insert mode start position
-- opt.backspace = "indent,eol,start"

-- clipboard uses system clipboard as default register
opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true
