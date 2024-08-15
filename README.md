# README

This is my `neovim` configuration.
`<leader>` represents leader.
This uses `Lazy` plugin loader access the menu via `:Lazy`.
This is a slightly tweaked version of `https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters`.
The contents of this folder should be stored in `~/.config/nvim`.

## Notes

### clang-format and -Wall

To change the C/C++ .clang-format file generate one

```
$ clang-format -style=file -dump-config > .clang-format
```

And change the lin "Standard: Latest" to for example "Standard: C++03".
This file then needs to be in the directory of the file you are applying the clang-format to

### When 'dd' overwrites the 'y' preventing a 'p'

```
"0p
- ": Allows you to see what registers contain what (0-9)
- 0: Chooses register 0 (should be what was yanked)
- p: Paste as normal
```

## Cheatsheet

### Comments

```
// (comment.lua)
gcc: Comment line
gbc: Comment line with block
[count]gcc: Toggles the number of line given as a prefix-count using linewise
[count]gbc: Toggles the number of line given as a prefix-count using blockwise
```

### File Browser

```
// (nvim-tree.lua)
<leader>ee: Open/close file browser
<leader>ef: Toggle file explorer on current file
<leader>ec: Collapse file explorer
<leader>er: Refresh file explorer
```

### Window Management

```
<leader>s(v/h): Split horizontally or vertically
<leader>se: Make splits equal size
<leader>sx: Close current split
<C-w>+/-: Increase/decrease split height (prefix with number for multiple)
<C-w>>/<: Increase/descrease splid width (prefix with number for multiple)
<C-w>=: Equalize all split sizes
// (vim-maximizer.lua)
<leader>sm: Maximize and un-maximize window
```

### Tabs

```
<leader>to: New tab
<leader>tx: Close tab
<leader>tn: Go to next tab
<leader>tp: Go to previous tab
<leader>tf: Open current buffer in new tab
```

### Folding

```
zo: Unfold under cursor
zc: Fold under cusror
// (ufo.lua)
zR: Unfold all
zM: Fold all
```

### Workspace Search

```
// (telescope.lua)
<leader>ff: Fuzzy find files in cwd
<leader>fr: Fuzzy find in recent files
<leader>fs: Find string in cwd
<leader>fc: Find string under cursor in cwd
<leader>ft: Find TODOs
<leader>fb: Find string in current buffer
// When in telescope's search window
<C-k>: Up result
<C-j>: Down result
<C-q>: Send to quick fix list
<C-r>+0-9: Choose and paste a register when window is up (insert mode)
```

### Obatining File Path

```
<leader>pr: Relative path to paste
<leader>pf: Abs path to paste
<leader>pn: Filename to paste
```

### Smart Parentheses

`*` represents the cursor position

```
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    asdf asdf asdf asdf asdf    ys3w"           "asdf asdf asdf" asdf asdf
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
```

### Substitute

```
// (substitute.lua)
s<motion>: Substitutes default register (aka what was last yanked) into the current word underneath cursor
ss: Substitutes default register into the current line
S: Substitutes default register until end of line
s: In visual mode substitutes  default register

```

### Problems Window

```
// (trouble.lua)
<leader>xw: Open trouble workspace diagnostics
<leader>xd: Open trouble document diagnostics
<leader>xq: Open trouble quickfix list
<leader>xl: Open trouble location list
<leader>xt: Open TODOs in trouble
```

### LSP/Formatting

```
// LSP (lspconfig.lua)
gR: Show LSP references
gD: Go to declaration
gd: Telescope LSP definitions
gi: Telescope LSP implementations
gt: Telescope LSP type definitions
<leader>ca: See available code actions
<leader>rn: Smart rename
<leader>D: Show buffer diagnostics
<leader>d: Show line diagnostics
[d: Go to previous diagnostic
]d: Go to next diagnostic
K: Show documentation for what is under the cursor
<leader>rs: Restart LSP

// Formatting (conform.lua)
<leader>mp: Conform (in either normal or visual mode)
```

### Sessions

```
// (auto-session.lua)
<leader>wr: Restore session
<leader>ws: Save session
```

### TODOs

```
// (todo-comments.lua)
]t: Next TODO
[t: Previous TODO
```

### Git

```
// (gitsigns.lua)
]h: Next hunk
[h: Previous hunk
<leader>hs: Stage hunk
<leader>hu: Undo stage hunk
<leader>hp: Hunk preview
<leader>hr: Reset hunk
<leader>hS: Stage whole buffer
<leader>hR: Reset buffer
<leader>hb: Blame line
<leader>hB: Toggle line blame
<leader>hd: Diff this
```

## Requirements

The following must be done in order for this configuration to work correctly

### Fonts

Run the following to obtain fonts properly

```
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Monaspace.tar.xz
mkdir MonaspiceNerdFont
tar -xvf Monaspace.tar.xz -C MonaspiceNerdFont
sudo cp -r MonaspiceNerdFont /usr/share/fonts
fc-cache -f -v
```

Then make sure to update your terminal's font

### Telescope

This is the fuzzy finder and requires `ripgrep`.

```
sudo apt install ripgrep
```

## Plugins

Below is a description of the plugins that are being installed, what files they live in, and what they do.

### `alpha-nvim`

Lives in `lua/pokhym/plugins/alpha.lua`.
Used to display the welcome message with some shortcuts that may be used in the startup menu.
This only works in `nvim` is started without any arguments.

### `auto-session`

Lives in `lua/pokhym/plugins/auto-session.lua`.
Used to save and restore sessions for a specific workspace folder.

### `auto-pairs`

Lives in `lua/pokhym/plugins/auto-pairs.lua`.
Generates auto-pairs.

### `bufferline`

Lives in `lua/pokhym/plugins/bufferline.lua`.
Very many aesthetic things.

### `Comment`

Lives in `lua/pokhym/plugins/comment.lua`.
Handles things like TODOs, FIXMEs, BUGs, or NOTEs in code.
In order for the coloring/Telescope to find these they must be the capital word terminated by a colon and be in a comment.

### `conform`

Lives in `lua/pokhym/plugins/conform.lua`.
Handles forcing code to conform to specific code standards.
Pleaser refer to `https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters` for a list of valid formatters to place in the setup function of `conform`.

### `dressing`

Lives in `lua/pokhym/plugins/dressing.lua`.
Some aesthetic changes.

### `gitsigns`

Lives in `lua/pokhym/plugins/gitsigns.lua`.
Used for git integration.
Note, a "hunk" is a set of contiguous lines that was modified.

### `indent-blankline`

Lives in `lua/pokhym/plugins/indent-blankline.lua`.
Performs auto-indentation.

### `nvim-lint`

Lives in `lua/pokhym/plugins/nvim-lint.lua`.
Performs linting.
Please refer to `https://github.com/mfussenegger/nvim-lint?tab=readme-ov-file#available-linters` for a list of linters to use.

### `lualine`

Lives in `lua/pokhym/plugins/lualine.lua`.
A status bar for `nvim`.

### `nvim-cmp`

Lives in `lua/pokhym/plugins/nvim-cmp.lua`.
An auto-completion plugin.
The completion sources are obtained by 3rd party dependencies as described in the source file `nvim-cmp.lua`.

### `nvim-surround`

Lives in `lua/pokhym/plugins/nvim-surround.lua`.
Apply parentheses around highlighed text.
This functionality is similar to where VS code if highlighting a section of text and simply press `(` or `)`.
An auto-completion plugin.
The completion sources are obtained by 3rd party dependencies as described in the source file `nvim-cmp.lua`.

### `nvim-tree`

Lives in `lua/pokhym/plugins/nvim-tree.lua`.
File browser tree view.

### `substitute`

Lives in `lua/pokhym/plugins/substitute.lua`.
Performs substitution with various modes using what is currently in the default register (aka what was yanked last).

### `telescope`

Lives in `lua/pokhym/plugins/telescope.lua`.
Performs workspace wide search for strings and TODOs.

### `todo-comments`

Lives in `lua/pokhym/plugins/todo-comments.lua`.
Highlights TODOs.

### `nvim-treesitter`

Lives in `lua/pokhym/plugins/nvim-treesitter.lua`.
Builds syntax trees for various languages.
Please refer to `https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#supported-languages` for the supported languages.

### `trouble`

Lives in `lua/pokhym/plugins/trouble.lua`.
Shows a "Problems" like window for open buffers.

### `vim-maximizer`

Lives in `lua/pokhym/plugins/vim-maximizera.lua`.
Maximizes and un-maximizes a window.

### `which-key`

Lives in `lua/pokhym/plugins/which-key.lua`.
After a specified delay show what key combinations are available and their shortcuts.

### Language Server Stuff

This ssection covers for LSP, linters, and formatters

The configuration for the LSP is stored under `lua/pokhym/plugins/lsp/lspconfig.lua`.
This includes things like the shortcuts used for the LSP.

To install new LSP/linters/formatters make changes in

- `lua/pokhym/plugins/mason.lua`

You can find out what possible options there are by using the `:Mason` command.
