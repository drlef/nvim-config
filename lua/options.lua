vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false

vim.opt.tabstop = 4         -- number of visual spaces per tab
vim.opt.softtabstop = 4     -- number of spaces in tab when editing
vim.opt.shiftwidth = 4      -- insert 4 spaces on a tab
vim.opt.expandtab = true

vim.opt.clipboard = 'unnamedplus'
vim.opt.cc = '100'
vim.opt.wildmode = 'longest,list'
vim.opt.autoread = true

-- Searching
vim.opt.incsearch = true    -- search as characters are entered
vim.opt.ignorecase = true   -- ignore case by default
vim.opt.smartcase = true    -- make it case sensitive if uppercase is entered
