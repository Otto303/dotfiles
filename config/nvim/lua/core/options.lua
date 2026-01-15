local opt = vim.opt

-- lines
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true 

opt.cursorline = true 

-- apparence
vim.cmd 'colorscheme vim'

vim.api.nvim_set_hl(0, "Pmenu", { bg = "#2c2c2c", fg = "#ffffff" });
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#005f87", fg = "#ffffff" });

vim.opt.colorcolumn = "80"
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#333333", fg = "NONE" });

vim.api.nvim_set_hl(0, "Comment", { bg = "NONE", fg = "#22CC44" });

-- backspace
opt.backspace = "indent,eol,start"

-- presse clipboard
opt.clipboard = "unnamedplus"

-- wondow split
opt.splitright = true
opt.splitbelow = true

opt.swapfile = false
