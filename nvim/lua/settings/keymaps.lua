local opts = { noremap = true, silent = true }

-- [[ Basic Keymaps ]]

-- Modes
-- normal_mode = 'n'
-- insert_mode = 'i'
-- visual_mode = 'v'
-- visual_block_mode = 'x'
-- term_mode = 't'
-- command_mode = 'c'

-- Normal

-- Set highlight on search, but clear on pressing <ESC> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')

-- NvimTree keymaps
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<C-f>', ':NvimTreeFocus<CR>', opts)

-- Telescope keymaps
vim.keymap.set('n', '<leader>sf', ':Telescope find_files<CR>', {desc = '[S]earch [F]iles'})

-- LazyGit keymaps
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', opts)

-- Split screens navigation
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)

-- Resize window keymaps
vim.keymap.set('n', '<A-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<A-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<A-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<A-Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<A-j>', ':<Esc>:m .+1<CR>==g', opts)
vim.keymap.set('n', '<A-k>', ':<Esc>:m .-2<CR>==g', opts)

vim.keymap.set('n', '<TAB>', ':bn<CR>', opts)
vim.keymap.set('n', '<S-TAB>', ':bp<CR>', opts)

-- Diagnostics keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {desc = 'Go to previous [D]iagnostic message'})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {desc = 'Go to next [D]iagnostic message'})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {desc = 'Show diagnostic [E]rror messages'})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {desc = 'Open diagnostic [Q]uickfix list'})

-- Insert
-- NvimTree keymaps
vim.keymap.set('i', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('i', '<C-f>', ':NvimTreeFocus<CR>', opts)

-- Visual
-- NvimTree keymaps
vim.keymap.set('v', '<C-n>', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('v', '<C-f>', ':NvimTreeFocus<CR>', opts)

-- Indent highlighted section
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Terminal
vim.keymap.set('t', '<ESC><ESC>', '<C-\\><C-n>', {desc = 'Exit terminal mode'})
