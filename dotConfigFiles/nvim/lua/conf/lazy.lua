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
    -- Language servers and co
    'williamboman/mason.nvim',           -- Optional
    'williamboman/mason-lspconfig.nvim', -- Optional
	
    -- Maanagement plugin
    'VonHeikemen/lsp-zero.nvim',
    -- LSP Support
    'neovim/nvim-lspconfig',             -- Required
    'hrsh7th/cmp-nvim-lsp', -- Required

    -- Autocompletion
    'hrsh7th/nvim-cmp',     -- Required

    'L3MON4D3/LuaSnip',
	},

	{'ThePrimeagen/refactoring.nvim'},
	{'folke/trouble.nvim'},
});
