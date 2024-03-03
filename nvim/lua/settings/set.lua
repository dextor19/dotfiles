-- [[ Set Options ]]

-- Set leader
-- must happen before plugins otherwise wrong leader will be loaded.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Show line numbers
vim.opt.number = true

-- enable mouse mode
vim.opt.mouse = "a"

-- dont show mode since in status bar
vim.opt.showmode = false

-- use relative numbers to reduce cognitive load went deleting lines.
vim.opt.relativenumber = true

-- enable break indent
vim.opt.breakindent = true

-- case insensitive searching UNLESS \C or Capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- always draw the signcolumn
vim.opt.signcolumn = "yes"

-- sync clipboard between OS and Neovim
vim.opt.clipboard = "unnamedplus"

-- went Neovim crashes, then doesn't save swapfile
vim.opt.swapfile = false

-- decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Configure how neovim will display certain whitespaces
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type
vim.opt.inccommand = "split"

-- show which line the cursor is on
vim.opt.cursorline = true

-- minimum number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- Tokyonight colorscheme
vim.cmd[[colorscheme tokyonight]]


vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

-- Tab spacing and auto indenting with spaces
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true


-- stop syntax highlighting for long lines
vim.opt.colorcolumn = "80"
vim.opt.wrap = false
