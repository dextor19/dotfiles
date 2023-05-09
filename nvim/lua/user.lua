local M = {}
local opts = { noremap = true, slient = true }

function M.setup()
  -- Show line numbers
  vim.opt.number = true
  vim.opt.relativenumber = true
  vim.opt.expandtab = true
  vim.opt.tabstop = 2
  vim.opt.shiftwidth = 2
  vim.opt.clipboard = "unnamedplus"

  -- Show some empty characters
  vim.opt.list = true

  -- Enable mouse support
  vim.opt.mouse = 'a'

  -- Set folding
  vim.opt.foldlevel = 7
  vim.cmd[[colorscheme tokyonight]]

  -- Modes
  -- normal_mode = 'n'
  -- insert_mode = 'i'
  -- visual_mode = 'v'
  -- visual_block_mode = 'x'
  -- term_mode = 't'
  -- command_mode = 'c'

  -- Normal
  vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
  vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>', opts)
  vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
  vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
  vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
  vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
  vim.keymap.set('n', '<A-Up>', ':resize -2<CR>', opts)
  vim.keymap.set('n', '<A-Down>', ':resize +2<CR>', opts)
  vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', opts)
  vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', opts)
  vim.keymap.set('n', '<A-j>', ':<Esc>:m .+1<CR>==g', opts)
  vim.keymap.set('n', '<A-k>', ':<Esc>:m .-2<CR>==g', opts)
  vim.keymap.set('n', '<TAB>', ':bn<CR>', opts)
  vim.keymap.set('n', '<S-TAB>', ':bp<CR>', opts)
  -- insert
  vim.keymap.set('i', '<C-n>', ':NvimTreeToggle<CR>', opts)
  vim.keymap.set('i', '<C-f>', ':NvimTreeFocus<CR>', opts)
  -- Visual
  vim.keymap.set('v', '<C-n>', ':NvimTreeToggle<CR>', opts)
  vim.keymap.set('v', '<C-f>', ':NvimTreeFocus<CR>', opts)
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
  vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv", opts)
  vim.keymap.set('v', '<', '<gv', opts)
  vim.keymap.set('v', '>', '>gv', opts)
end

return M
