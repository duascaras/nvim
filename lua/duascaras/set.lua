-- Just trying it out
-- vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true
vim.opt.linebreak = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.wrap = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.fixeol = false

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.opt.numberwidth = 5

vim.cmd [[
  highlight LineNr guifg=bg guibg=NONE
  highlight CursorLineNr guifg=bg guibg=NONE
]]

vim.opt.colorcolumn = ""

