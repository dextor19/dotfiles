local M = {}
local opts = { noremap = true, silent = true }
local set = vim.opt

function M.setup()
  -- Show line numbers
  set.number = true
  set.relativenumber = true
  set.expandtab = true
  set.tabstop = 2
  set.shiftwidth = 2
  set.clipboard = "unnamedplus"
  set.swapfile = false

  -- Show some empty characters
  set.list = true

  -- Set folding
  set.foldlevel = 7
  vim.g.mapleader = ","
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
  vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
  vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
  vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', opts)
  vim.keymap.set('n', '<leader>gs', ':Telescope git_status<CR>', opts)
  vim.keymap.set('n', '<leader>gl', ':Telescope git_commits<CR>', opts)
  vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', opts)
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

  -- Insert
  vim.keymap.set('i', '<C-n>', ':NvimTreeToggle<CR>', opts)
  vim.keymap.set('i', '<C-f>', ':NvimTreeFocus<CR>', opts)

  -- Visual
  vim.keymap.set('v', '<C-n>', ':NvimTreeToggle<CR>', opts)
  vim.keymap.set('v', '<C-f>', ':NvimTreeFocus<CR>', opts)
  vim.keymap.set('v', '<', '<gv', opts)
  vim.keymap.set('v', '>', '>gv', opts)
end

return M
