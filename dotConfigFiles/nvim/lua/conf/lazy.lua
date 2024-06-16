local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- this needs to be here first so that it will work.
vim.g.mapleader = " "

local lazy = require("lazy").setup({
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
		},
	},
	{ 'nvim-treesitter/nvim-treesitter',  build = ':TSUpdate' },
	{ 'nvim-treesitter/playground' },

	{ 'ThePrimeagen/harpoon'},

	{ 'mbbill/undotree'}, 
	{'tpope/vim-fugitive'},

	{ 'VonHeikemen/lsp-zero.nvim'},
      -- Language servers and co
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
      -- LSP Support
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},

      -- Autocompletion
  {'hrsh7th/nvim-cmp', 'L3MON4D3/LuaSnip', 'hrsh7th/vim-vsnip', 'hrsh7th/cmp-vsnip'},


  {'ThePrimeagen/refactoring.nvim'},
	{'folke/trouble.nvim'},
  -- {"kwsp/halcyon-neovim"}, -- Theme
  {"projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config =function() 
      require('github-theme').setup({
        dim_inactive = true,
        options = {
          styles = {
            comments = 'italic',
            keywords = 'bold',
            types = 'bold'
          }
        }
      })

      vim.cmd('colorscheme github_dark_colorblind')
    end,
  },
  {"lervag/vimtex"},
  {"sindrets/diffview.nvim"},
  {"mg979/vim-visual-multi"},
});




