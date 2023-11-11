local M = {}

function M.setup()
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
        require('config.autopairs').setup()
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
        require('config.cmp').setup()
      end
    })

    -- Gitsigns
    use ({
      'lewis6991/gitsigns.nvim',
      config = function()
        require('config.gitsigns').setup()
      end
    })

    -- File Tree
    use({
      'kyazdani42/nvim-tree.lua',
      after = { 'nvim-web-devicons' },
      config = function()
        require('config.nvimtree').setup()
      end
    })

    -- LSP
    use({
      'neovim/nvim-lspconfig',
      after = { 'cmp-nvim-lsp' },
      config = function()
        require('config.lsp').setup()
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
        require('config.lualine').setup()
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
        require('config.null-ls').setup()
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
      after = { 'nvim-treesitter', 'nvim-web-devicons', 'plenary.nvim' },
      module = 'telescope',
      config = function()
        require('config.telescope').setup()
      end
    })

    -- Treesitter
    use({
      'nvim-treesitter/nvim-treesitter',
      config = function()
        require('config.treesitter').setup()
      end
    })

    -- Webdev Icons
    use({
      'kyazdani42/nvim-web-devicons',
      config = function()
        require('config.webdevicons').setup()
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
end

return M
