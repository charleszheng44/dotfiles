local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
	'nvim-lualine/lualine.nvim',
	'nvim-treesitter/nvim-treesitter',
	'preservim/vimux',
	'glepnir/lspsaga.nvim',
	{
		'phaazon/hop.nvim',
		branch = 'v2'
	},
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	'simrat39/rust-tools.nvim',
	{
		'akinsho/bufferline.nvim',
		version = "*"
	},

	-- completion
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
	{
		'L3MON4D3/LuaSnip',
		dependencies = { 'rafamadriz/friendly-snippets' }
	},
	'saadparwaiz1/cmp_luasnip',
	'github/copilot.vim',
	'williamboman/mason.nvim',
	'neovim/nvim-lspconfig',
	'williamboman/mason-lspconfig.nvim',

	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.4',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},

	-- {
	--     "jackMort/ChatGPT.nvim",
	--     event = "VeryLazy",
	--     config = function()
	--         require("chatgpt").setup()
	--     end,
	--     dependencies = {
	--         "MunifTanjim/nui.nvim",
	--         "nvim-lua/plenary.nvim",
	--         "nvim-telescope/telescope.nvim"
	--     }
	-- },

	-- colorschemes
	'nyoom-engineering/oxocarbon.nvim',
	'EdenEast/nightfox.nvim',
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000
	},
	'rebelot/kanagawa.nvim',
	{
		'rose-pine/neovim',
		name = 'rose-pine'
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = true,
		opts = ...
	},

	-- language specific
	'psf/black',

	-- git integration
	'f-person/git-blame.nvim',
	'lewis6991/gitsigns.nvim',
}

local opts = {}

require('lazy').setup(plugins, opts)
