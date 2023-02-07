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
vim.opt.rtp:prepend(lazypath) -- }}}

vim.g.mapleader = " "

require("lazy").setup({
	-- Colorscheme
	{ "folke/tokyonight.nvim", config = function() require "plugins.tokyonight" end,
		lazy = false,
		priority = 1000
	},

	-- Mandatory
	{ "lewis6991/impatient.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", config = function() require "plugins.treesitter" end,
		run = ":TSUpdate"
	},
	{ "p00f/nvim-ts-rainbow" },
	{ "romgrk/nvim-treesitter-context", config = function() require "plugins.treesitter-context" end },
	{ "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },
	{ "windwp/nvim-ts-autotag", config = function() require("nvim-ts-autotag").setup() end },
	{ "p00f/nvim-ts-rainbow" },
	{ "windwp/nvim-autopairs", config = function() require "plugins.autopairs" end },
	{ "nvim-treesitter/playground", event = "BufRead" },

	-- Navigation
	{ "nvim-tree/nvim-tree.lua", config = function() require "plugins.nvim-tree" end,
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
	{ "nvim-telescope/telescope.nvim", config = function() require "plugins.telescope" end,
		branch = "0.1.x",
		dependencies = { "telescope-fzf-native.nvim" },
		cmd = "Telescope",
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
	{ 'nvim-telescope/telescope-symbols.nvim' },

	-- Comments
	{ "LudoPinelli/comment-box.nvim", config = function() require "plugins.comment-box" end },
	{ "numToStr/Comment.nvim", config = function() require "plugins.comment" end },

	-- Debugging
	{ "akinsho/toggleterm.nvim", config = function() require "plugins.toggleterm" end },

	-- Visuals
	{ "RRethy/vim-illuminate", config = function()
		require('illuminate').configure({
			delay = 500,
		}) end
	},
	{ 'ojroques/nvim-hardline', config = function() require "plugins.hardline" end },
	{ "lukas-reineke/indent-blankline.nvim", config = function() require "plugins.indentline" end },
	{ "norcalli/nvim-colorizer.lua", config = function() require"colorizer".setup() end },
	{ "lewis6991/gitsigns.nvim", config = function() require "plugins.gitsigns" end },

	-- Vanilla
	{ "qiushihe/vim-bbye" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "folke/zen-mode.nvim", cmd = { "ZenMode" } },
	{ "lambdalisue/suda.vim" },
	{ "godlygeek/tabular" },
	{ "felipec/vim-sanegx", event = "BufRead" },
	{ "wellle/targets.vim" },

	-- Miscellaneous
	{ "folke/which-key.nvim", config = function() require "plugins.whichkey" end }
})
