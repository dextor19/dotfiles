local M = {}

function M.setup()
  -- Show line numbers
  vim.opt.number = true
  vim.opt.relativenumber = true

  -- Show some empty characters
  vim.opt.list = true

  -- Enable mouse support
  vim.opt.mouse = 'a'

  -- Set folding
  vim.opt.foldlevel = 7
  vim.cmd[[colorscheme tokyonight]]
  vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  vim.keymap.set('i', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  vim.keymap.set('v', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
  vim.keymap.set('i', '<C-f>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
  vim.keymap.set('v', '<C-f>', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
end

return M
