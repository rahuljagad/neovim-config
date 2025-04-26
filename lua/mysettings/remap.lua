vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Start neovim file explorer.
keymap('n', 'F', ':NvimTreeOpen<CR>', default_opts)

-- macro recorders to register 'c' to mean comment multiple lines
-- Register 'c' is meant to add a comment to beginning of the line
-- So, you can run @c to comment a line ot 3@c to comment multiple lines
vim.fn.setreg('c', '^i#€kd')
