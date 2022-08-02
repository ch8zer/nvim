-- keymap args:
--  mode ( 'n' = normal, 'v' = visual, 'i' = insert )
--  keybinding
--  actions
--  opts
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Save Macros (Ctrl+s)
keymap("n", "<C-S>", ":wa<cr>", opts)
keymap("v", "<C-S>", "<esc>:wa<cr>", opts)
keymap("i", "<C-S>", "<esc>:wa<cr>", opts)

-- Spellcheck
keymap("n", "<F6>", ":setlocal spell! spelllang=en_us<CR>", opts)
keymap("i", "<F6>", "<C-\\><C-O>:setlocal spell! spelllang=en_us<CR>", opts)

-- Resize with arrow keys
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
