-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
 -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.2',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
	  'folke/tokyonight.nvim',
	  as = 'tokyonight',
	  config = function()
		  vim.cmd('colorscheme tokyonight-night')
	  end
  }


  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate'} }
  use { 'nvim-treesitter/playground' }

  use { 'ThePrimeagen/harpoon'}

  use { 'mbbill/undotree'} 
  use {'tpope/vim-fugitive'}

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-buffer'},     -- Required
		  {'hrsh7th/cmp-path'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'hrsh7th/cmp-nvim-lua'}, -- Required
		  {'saadparwaiz1/cmp_luasnip'},

		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use {'ThePrimeagen/refactoring.nvim'}
  use {'folke/trouble.nvim'}
end)
