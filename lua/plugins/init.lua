-- TODO: cambiar esta porqueria a packer
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

	-- LSP
	{ "neovim/nvim-lspconfig",
		lazy = true,
		dependencies = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
	},
	{ "williamboman/mason-lspconfig.nvim", lazy = true },
	{ "tamago324/nlsp-settings.nvim", lazy = true },
	{ "jose-elias-alvarez/null-ls.nvim", lazy = true },
	{ "williamboman/mason.nvim", config = function() require "plugins.mason" end, },

	-- Completion
	{ "hrsh7th/nvim-cmp", config = function() require "plugins.cmp" end },
	{ "L3MON4D3/LuaSnip", config = function() require "plugins.luasnip" end },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-cmdline" },
	{ "petertriho/cmp-git" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "rafamadriz/friendly-snippets" },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", config = function() require "plugins.treesitter" end,
		run = ":TSUpdate"
	},
	{ "p00f/nvim-ts-rainbow" },
	{ "romgrk/nvim-treesitter-context", config = function() require "plugins.treesitter-context" end },
	-- { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" },
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
	{ "nvim-telescope/telescope-symbols.nvim" },

	-- Comments
	{ "LudoPinelli/comment-box.nvim", config = function() require "plugins.comment-box" end },
	{ "numToStr/Comment.nvim", config = function() require "plugins.comment" end },

	-- Debugging
	{ "akinsho/toggleterm.nvim", config = function() require "plugins.toggleterm" end },

	-- Visuals
	{ "RRethy/vim-illuminate", config = function()
		require("illuminate").configure({
			delay = 500,
		}) end
	},
	{ "ojroques/nvim-hardline", config = function() require "plugins.hardline" end },
	{ "lukas-reineke/indent-blankline.nvim", config = function() require "plugins.indentline" end },
	{ "norcalli/nvim-colorizer.lua", config = function() require"colorizer".setup() end },
	{ "lewis6991/gitsigns.nvim", config = function() require "plugins.gitsigns" end },

	-- Markdown
	{ "npxbr/glow.nvim", ft = { "markdown" } },

	-- HTML/CSS/JS
	{ "neoclide/vim-jsx-improve", ft = { "javascript", "javascriptreact" } },
	{ "joshua7v/vim-tsx-improve", ft = { "typescript", "typescriptreact" } },
	{
		"turbio/bracey.vim",
		cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
		build = "npm install --prefix server",
	},

	-- Rust
	"simrat39/rust-tools.nvim",
	{
		"saecki/crates.nvim",
		version = "v0.3.0",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup({
				-- null_ls = { enabled = true, name = "crates.nvim" },
				popup = { border = "rounded" },
			})
		end,
	},

	-- Vanilla
	{ "qiushihe/vim-bbye" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "folke/zen-mode.nvim", cmd = { "ZenMode" } },
	{ "lambdalisue/suda.vim" },
	{ "godlygeek/tabular" },
	{ "felipec/vim-sanegx", event = "BufRead" },
	{ "wellle/targets.vim" },
	{ "NMAC427/guess-indent.nvim", config = function() require("guess-indent").setup{} end },

	-- Miscellaneous
	{ "folke/which-key.nvim", config = function() require "plugins.whichkey" end },
	{ "vimwiki/vimwiki", ft = { "vimwiki", "markdown" }, },
	{ "folke/todo-comments.nvim", config = function () require("todo-comments").setup ({}) end,
		dependencies = "nvim-lua/plenary.nvim",
	}
})

-- Vimwiki global variables{{{
vim.cmd("let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
-- vim.cmd("let g:vimwiki_key_mappings = { 'global': 0, }")
vim.cmd("hi VimwikiHeader2 guifg=#ffb86c gui=bold")
vim.cmd("hi VimwikiHeader3 guifg=#ff79c6 gui=bold")
vim.cmd("hi VimwikiHeader4 guifg=#50fa7b gui=bold")
vim.cmd("hi VimwikiHeader5 guifg=#f1fa8c gui=italic")
vim.cmd("hi VimwikiHeader6 guifg=#f1fa8c")
vim.cmd("hi VimwikiLink    guifg=#8BE9FD gui=italic")-- }}}
