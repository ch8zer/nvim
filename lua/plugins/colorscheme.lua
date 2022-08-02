-- Set color scheme
vim.o.termguicolors = true
local ok, _ = pcall(vim.cmd, 'colorscheme palenight')

-- Enable transparency
require("transparent").setup({
  enable = true, -- boolean: enable transparent
})

