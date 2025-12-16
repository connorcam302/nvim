local opt = vim.opt

opt.nu = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.swapfile = false
opt.backup = false

opt.hlsearch = false
opt.incsearch = true
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.undodir"

opt.scrolloff = 8
opt.signcolumn = "yes"

opt.isfname:append("@-@")

opt.updatetime = 50

opt.termguicolors = true

opt.clipboard = "unnamedplus"

opt.breakindent = true

opt.list = true
opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }
