local M = {}

function M.setup()
  vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
  local cmp = require('cmp')
  local lspkind = require('lspkind')
  cmp.setup({
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end
    },
    experimental = {
	native_menu = false,
	ghost_text = true,
    },
    formatting = {
	format = lspkind.cmp_format {
		menu = {
		with_text = true,
		buffer = "[buf]",
		nvim_lsp = "[LSP]",
		path = "[path]",
		luasnip = "[snip]",
		},
	},
    },
    sources = {
      { name = 'buffer' },
      { name = 'luasnip' },
      { name = 'nvim_lsp' },
      { name = 'path' },
      { name = 'treesitter' }
    }
  })

  -- Auto Pairs
  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

return M








































































































































