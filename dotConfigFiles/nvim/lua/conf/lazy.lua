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
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},


  {'ThePrimeagen/refactoring.nvim'},
	{'folke/trouble.nvim'},
  {
      "zbirenbaum/copilot-cmp",
      config = function()
          require("copilot_cmp").setup()
      end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    opts = {
      debug = true, -- Enable debugging
      -- See Configuration section for rest
    },
    -- See Commands section for default commands if you want to lazy load on them
  },
 -- This didnt work yet
 --  { "kevinhwang91/nvim-ufo" , requires = 'kevinhwang91/promise-async'}
 -- {"nyoom-engineering/oxocarbon.nvim"}
 {"kwsp/halcyon-neovim"}

});



