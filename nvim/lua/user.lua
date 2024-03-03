local M = {}
local opts = { noremap = true, silent = true }

function M.setup()
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
  vim.keymap.set('n', '<leader>sh', ':Telescope help_tags<CR>', {desc = '[S]earch [H]elp'})
  vim.keymap.set('n', '<leader>sf', ':Telescope find_files<CR>', {desc = '[S]earch [F]iles'})
  vim.keymap.set('n', '<leader>sw', ':Telescope grep_string<CR>', {desc = '[S]earch current [W]ord'})
  vim.keymap.set('n', '<leader>sg', ':Telescope live_grep<CR>', {desc = '[S]earch by [G]rep'})
  vim.keymap.set('n', '<leader>sd', ':Telescope diagnostics<CR>', {desc = '[S]earch [D]iagnostics'})
  vim.keymap.set('n', '<leader>gs', ':Telescope git_status<CR>', {desc = '[G]it [S]tatus'})
  vim.keymap.set('n', '<leader>gc', ':Telescope git_commits<CR>', {desc = '[G]it [C]ommits'})
  vim.keymap.set('n', '<leader><leader>', ':Telescope buffers<CR>', {desc = '[ ] Find existing buffers'})

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

  -- [[ Basic Autocommands ]] 

  -- Highlight when yanking (copying) text
  --  Try it with `yap` in normal mode
  --  See `:help vim.highlight.on_yank()`
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })

end

return M
