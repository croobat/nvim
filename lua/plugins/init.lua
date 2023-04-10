-- Setup {{{
local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins file
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost /home/tony/.config/nvim/lua/plugins/init.lua source <afile> | PackerSync
	augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

return packer.startup(function(use) --}}}
	-- Mandatory
	use { "wbthomason/packer.nvim" }
	use { "lewis6991/impatient.nvim" }
	use { "nvim-lua/popup.nvim" }
	use { "nvim-lua/plenary.nvim" }

	-- Colorscheme
	use { "folke/tokyonight.nvim", config = "require 'plugins.tokyonight'" }

	-- Completion
	use { "hrsh7th/nvim-cmp", config = "require 'plugins.cmp'" }
	use { "L3MON4D3/LuaSnip", config = "require 'plugins.luasnip'" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-cmdline" }
	use { "petertriho/cmp-git" }
	use { "saadparwaiz1/cmp_luasnip" }
	use { "rafamadriz/friendly-snippets" }

	-- Treesitter
	use { "nvim-treesitter/nvim-treesitter", config = "require 'plugins.treesitter'",
		run = ":TSUpdate"
	}
	use { "p00f/nvim-ts-rainbow" }
	use { "romgrk/nvim-treesitter-context", config = "require 'plugins.treesitter-context'" }
	use { "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead" }
	use { "windwp/nvim-ts-autotag", config = "require('nvim-ts-autotag').setup()" }
	use { "windwp/nvim-autopairs", config = "require 'plugins.autopairs'" }
	use { "nvim-treesitter/playground", event = "BufRead" }

	-- Navigation
	use { "nvim-tree/nvim-tree.lua", config = "require 'plugins.nvim-tree'",
		requires = { "nvim-tree/nvim-web-devicons" },
		tag = "nightly"
	}
	use { "nvim-telescope/telescope.nvim", config = "require 'plugins.telescope'",
		branch = "0.1.x",
		requires = { "telescope-fzf-native.nvim" },
		cmd = "Telescope",
	}
	use { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
	use { "nvim-telescope/telescope-symbols.nvim" }

	-- LSP
	use { "neovim/nvim-lspconfig",
		requires = { "mason-lspconfig.nvim", "nlsp-settings.nvim" },
	}
	use { "williamboman/mason-lspconfig.nvim" }
	use { "tamago324/nlsp-settings.nvim" }
	use { "jose-elias-alvarez/null-ls.nvim" }
	use { "williamboman/mason.nvim", config = "require 'plugins.mason'" }

	-- Comments
	use { "LudoPinelli/comment-box.nvim", config = "require 'plugins.comment-box'" }
	use { "numToStr/Comment.nvim", config = "require 'plugins.comment'" }

	-- Debugging
	use { "akinsho/toggleterm.nvim", config = "require 'plugins.toggleterm'" }

	-- Visuals
	use { "RRethy/vim-illuminate", config = "require('illuminate').configure({ delay = 500, })" }
	use { "ojroques/nvim-hardline", config = "require 'plugins.hardline'" }
	use { "lukas-reineke/indent-blankline.nvim", config = "require 'plugins.indentline'" }
	use { "norcalli/nvim-colorizer.lua", config = "require 'colorizer'.setup()" }
	use { "lewis6991/gitsigns.nvim", config = "require 'plugins.gitsigns'" }

	-- Markdown
	use { "npxbr/glow.nvim", ft = { "markdown" } }
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

	-- HTML/CSS/JS
	use { "neoclide/vim-jsx-improve", ft = { "javascript", "javascriptreact" } }
	use { "joshua7v/vim-tsx-improve", ft = { "typescript", "typescriptreact" } }
	use { "turbio/bracey.vim",
		cmd = { "Bracey", "BracyStop", "BraceyReload", "BraceyEval" },
		build = "npm install --prefix server",
	}

	-- Rust
	use { "simrat39/rust-tools.nvim" }
	use { "saecki/crates.nvim", config = function()
		require("crates").setup({
			-- null_ls = { enabled = true, name = "crates.nvim" },
			popup = { border = "rounded" },
		})
	end,
		version = "v0.3.0",
		requires = { "nvim-lua/plenary.nvim" },
	}

	-- Vanilla
	use { "qiushihe/vim-bbye" }
	use { "tpope/vim-surround" }
	use { "tpope/vim-repeat" }
	use { "folke/zen-mode.nvim", cmd = { "ZenMode" } }
	use { "lambdalisue/suda.vim" }
	use { "godlygeek/tabular" }
	use { "felipec/vim-sanegx", event = "BufRead" }
	use { "wellle/targets.vim" }
	use { "NMAC427/guess-indent.nvim", config = function() require("guess-indent").setup() end }

	-- Miscellaneous
	use { "folke/which-key.nvim", config = function() require "plugins.whichkey" end }
	use { "vimwiki/vimwiki", config = "require 'plugins.vimwiki'",
		ft = { "vimwiki", "markdown" }
	}
	use { "folke/todo-comments.nvim", config = function() require("todo-comments").setup() end,
		requires = "nvim-lua/plenary.nvim",
	}

	-- Finish setup{{{
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end) -- }}}
