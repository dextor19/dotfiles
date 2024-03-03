local M = {}

function M.setup()
  require('nvim-treesitter.configs').setup({
    ensure_installed = { 'c', 'cpp', 'go', 'nix', 'python', 'rust', 'lua', 'vim', 'markdown', 'vimdoc', 'bash', 'html' },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  })
end

return M
