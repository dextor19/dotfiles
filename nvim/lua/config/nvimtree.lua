local M = {}

function M.setup()
  require('nvim-tree').setup({
    respect_buf_cwd = true,
    filters = {
      dotfiles = false,
      git_ignored = false,
    },
    update_cwd = true,
    update_focused_file = {
      enable = true,
      update_cwd = true
    }
  })
end

return M
