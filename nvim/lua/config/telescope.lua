

local M = {}

function M.setup()
  local telescope = require('telescope')
  local builtin = require('telescope.builtin')
  telescope.setup()
  vim.keymap.set('n', '<leader>ff', function() builtin.find_files(require('telescope.themes').get_dropdown({ no_ignore = true, hidden = true })) end, {})
  vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
  vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
  vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  vim.keymap.set('n', '<leader>cm', builtin.git_commits, {})
  vim.keymap.set('n', '<leader>gt', builtin.git_status, {})
end

return M
