local opt_global = vim.o
local opt_window = vim.wo
local opt_buffer = vim.bo

-- global options
opt_global.swapfile = true
opt_global.dir = '/tmp/nvim/'
opt_global.hlsearch = true

-- window options
opt_window.number = true

-- buffer settings
opt_buffer.expandtab = true
opt_buffer.tabstop = 4
opt_buffer.shiftwidth = 4


