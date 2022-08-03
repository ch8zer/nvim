-- Set color scheme
vim.o.termguicolors = true
vim.cmd[[colorscheme tokyonight]]

-- Enable transparency
require("transparent").setup({
  enable = true, -- boolean: enable transparent
})

