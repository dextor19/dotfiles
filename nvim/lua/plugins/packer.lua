local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

vim.cmd [[ packadd packer.nvim ]]

require('packer').startup(function(use)
  -- Autopairs
  use({
    'windwp/nvim-autopairs',
    after = { 'nvim-treesitter' },
    config = function()
      require('nvim-autopairs').setup({
	check_ts = true
      })
    end
  })

  use({
    'folke/tokyonight.nvim'
  })

  -- Boostrap package manager
  use({
    'wbthomason/packer.nvim'
  })

  -- Completion
  use({
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer', after = { 'nvim-cmp' } } ,
      { 'hrsh7th/cmp-nvim-lsp', after = { 'nvim-cmp' } },
      { 'hrsh7th/cmp-path', after = { 'nvim-cmp' } },
      { 'ray-x/cmp-treesitter', after = { 'nvim-cmp' } },
      { 'saadparwaiz1/cmp_luasnip', after = { 'LuaSnip', 'nvim-cmp' } }
    },
    after = { 'nvim-autopairs' },
    config = function()
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
  })

  -- Gitsigns
  use ({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  })

  -- File Tree
  use({
    'kyazdani42/nvim-tree.lua',
    after = { 'nvim-web-devicons' },
    config = function()
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
  })

  -- LSP
  use({
    'neovim/nvim-lspconfig',
    after = { 'cmp-nvim-lsp' },
    config = function()
      require("nvim-lsp-installer").setup {}
      local lspconfig = require('lspconfig')
      local util = require('lspconfig/util')
      -- Provide capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap=true, silent=true, buffer=bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, bufopts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
        vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
        vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
      end
      local lsp_flags = {
        -- This is the default in Nvim 0.7+
        debounce_text_changes = 150,
      }
      -- Setup Language Servers
      lspconfig.gopls.setup({
              capabilities = capabilities,
              on_attach = on_attach,
        cmd = {"gopls"},
        file_types = {"go", "gomod"},
        root_dir = util.root_pattern("go.work", "go.mod", ".git"),
              flags = lsp_flags,
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          }
        }
      })
      lspconfig.rust_analyzer.setup({
              capabilities = capabilities,
              on_attach = on_attach,
        file_types = {"rust"},
        root_dir = util.root_pattern("Cargo.toml"),
        settings = {
          ['rust_analyzer'] = {
            allFeatures = true,
          }
        }
      })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.tsserver.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = {'vim'},
            }
          }
        }
      })
    end
  })

  use({
      'williamboman/nvim-lsp-installer'
  })

  -- Lualine
  use({
    'nvim-lualine/lualine.nvim',
    after = { 'nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  })

  -- Luasnip
  use({
    'L3MON4D3/LuaSnip'
  })

  -- Null-ls
  use({
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
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
  })


  -- Plenary
  use({
    'nvim-lua/plenary.nvim'
  })

  -- LazyGit
  use({
    'kdheepak/lazygit.vim'
  })

  -- Telescope (Fuzzy Finder)
  use({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    after = { 'nvim-treesitter', 'nvim-web-devicons', 'plenary.nvim' },
    config = function()
        require('telescope').setup()
        local builtin = require('telescope.builtin')
        -- Telescope keymaps
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, {desc = '[S]earch [H]elp'})
        -- vim.keymap.set('n', '<leader>sf', builtin.find_files, {desc = '[S]earch [F]iles'})
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, {desc = '[S]earch current [W]ord'})
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, {desc = '[S]earch by [G]rep'})
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {desc = '[S]earch [D]iagnostics'})
        vim.keymap.set('n', '<leader>gs', builtin.git_status, {desc = '[G]it [S]tatus'})
        vim.keymap.set('n', '<leader>gc', builtin.git_commits, {desc = '[G]it [C]ommits'})
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, {desc = '[ ] Find existing buffers'})
    end
  })

  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'c', 'cpp', 'go', 'nix', 'python', 'rust', 'lua', 'vim', 'markdown', 'vimdoc', 'bash', 'html' },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  })

  -- Webdev Icons
  use({
    'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-web-devicons').setup({
        default = true
      })
    end
  })

  use({
      'onsails/lspkind.nvim'
  })

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require('packer').sync()
  end
end)
