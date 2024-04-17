-- Setup {{{
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
-- }}}

local plugins = {
	-- Mandatory
	"lewis6991/impatient.nvim",
	"nvim-lua/popup.nvim",
	"nvim-lua/plenary.nvim",
	{
		"zbirenbaum/copilot.lua",
		init = function() require "plugins.copilot" end,
		cmd = { "Copilot", lazy = false },
		event = "InsertEnter",
	},

	-- Colorscheme
	{ "folke/tokyonight.nvim",       init = function() require "plugins.tokyonight" end },

	-- Completion
	{ "hrsh7th/nvim-cmp",            init = function() require "plugins.cmp" end },
	{ "L3MON4D3/LuaSnip",            init = function() require "plugins.luasnip" end },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-cmdline" },
	{ "petertriho/cmp-git" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		init = function() require "plugins.treesitter" end,
		run = ":TSUpdate"
	},
	{ "romgrk/nvim-treesitter-context",           init = function() require "plugins.treesitter-context" end },
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		init = function() require "plugins.treesitter-context-commentstring" end,
		event = "BufRead"
	},

	-- Navigation
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function() require "plugins.nvim-tree" end
	},
	{
		"nvim-telescope/telescope.nvim",
		init = function() require "plugins.telescope" end,
		tag = "0.1.6",
		cmd = "Telescope"
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-telescope/telescope-symbols.nvim" },

	-- LSP
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "tamago324/nlsp-settings.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim",          init = function() require "plugins.null-ls" end },
	{ "williamboman/mason.nvim",                  init = function() require "plugins.mason" end },
	{ 'MunifTanjim/prettier.nvim' },

	-- Debugging
	{ "akinsho/toggleterm.nvim",                  init = function() require "plugins.toggleterm" end },

	-- Visuals
	{ "RRethy/vim-illuminate",                    init = function() require('illuminate').configure({ delay = 500 }) end },
	{ "ojroques/nvim-hardline",                   init = function() require "plugins.hardline" end },
	{ "lukas-reineke/indent-blankline.nvim",      init = function() require "plugins.indentline" end },
	{ "norcalli/nvim-colorizer.lua",              init = function() require "colorizer".setup() end },
	{ "lewis6991/gitsigns.nvim",                  init = function() require "plugins.gitsigns" end },

	-- Markdown
	{ "npxbr/glow.nvim",                          ft = { "markdown" } },
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},

	-- HTML/CSS/JS
	{ "neoclide/vim-jsx-improve",     ft = { "javascript", "javascriptreact" } },
	{ "joshua7v/vim-tsx-improve",     ft = { "typescript", "typescriptreact" } },

	-- Comments
	{ "LudoPinelli/comment-box.nvim", init = function() require "plugins.comment-box" end },
	{ "numToStr/Comment.nvim",        init = function() require "plugins.comment" end },

	-- Vanilla
	{ "qiushihe/vim-bbye" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" }
	},
	{ "lambdalisue/suda.vim" },
	{ "godlygeek/tabular" },
	{
		"felipec/vim-sanegx",
		event = "BufRead"
	},
	{ "wellle/targets.vim" },
	{ "NMAC427/guess-indent.nvim", init = function() require("guess-indent").setup() end },

	-- Miscellaneous
	{
		"folke/neoconf.nvim",
		cmd = "Neoconf"
	},
	"folke/neodev.nvim",
	{ "folke/which-key.nvim", init = function() require "plugins.whichkey" end },
	{
		"vimwiki/vimwiki",
		ft = { "vimwiki", "markdown" },
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		init = function() require("todo-comments").setup() end,
		requires = "nvim-lua/plenary.nvim"
	},
	{ "sotte/presenting.vim" },
}

require("lazy").setup(plugins, opts)
