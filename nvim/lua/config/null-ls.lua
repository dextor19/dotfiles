local M = {}

function M.setup()
  local null_ls = require('null-ls')
  local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        bufnr = bufnr,
      })
    end
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
  local sources = {
    null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.diagnostics.deadnix,
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.gofmt,
    null_ls.builtins.formatting.goimports,
    null_ls.builtins.formatting.nixfmt,
    null_ls.builtins.formatting.rustfmt
  }
  null_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({
          group = augroup,
          buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
            lsp_formatting(bufnr)
          end,
        })
      end
    end,
  })
end

return M
