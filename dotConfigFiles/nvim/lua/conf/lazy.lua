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

	{
		'VonHeikemen/lsp-zero.nvim',
		dependencies = {
			-- LSP Support
			'neovim/nvim-lspconfig',             -- Required
			'williamboman/mason.nvim',           -- Optional
			'williamboman/mason-lspconfig.nvim', -- Optional

			-- Autocompletion
			'hrsh7th/nvim-cmp',     -- Required
			'hrsh7th/cmp-buffer',     -- Required
			'hrsh7th/cmp-path',     -- Required
			'hrsh7th/cmp-nvim-lsp', -- Required
			'hrsh7th/cmp-nvim-lua', -- Required
			'saadparwaiz1/cmp_luasnip',

			'L3MON4D3/LuaSnip',
			'rafamadriz/friendly-snippets',
		},
	},

	{'ThePrimeagen/refactoring.nvim'},
	{'folke/trouble.nvim'},
	{'andweeb/presence.nvim'},
})

