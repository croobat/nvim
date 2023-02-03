-- TODO: install highlight
-- TODO: install plugin manager
--## Setup ## {{{
local packer = require('packer')

-- Have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

return packer.startup(function(use) --}}}

	-- Colorscheme
	use { 'folke/tokyonight.nvim' }

	-- Mandatory
	use { "lewis6991/impatient.nvim" }
	use { "wbthomason/packer.nvim" }
	use { "nvim-lua/popup.nvim" }
	use { "nvim-lua/plenary.nvim" }

	-- Completion
	-- LSP
	use { "williamboman/mason.nvim", config = "require 'plugins.mason'" }
	use { "williamboman/mason-lspconfig.nvim" }
	use { "neovim/nvim-lspconfig", config = "require 'plugins.lsp'" }
	use { "jose-elias-alvarez/null-ls.nvim", config = "require 'plugins.null'" }
	-- CMP
	use { "hrsh7th/nvim-cmp", config = "require 'plugins.cmp'" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-cmdline" }
	use { "petertriho/cmp-git" }
	-- Luasnip
	use { "L3MON4D3/LuaSnip", config = "require 'plugins.luasnip'" }
	use { "saadparwaiz1/cmp_luasnip" }
	use { "rafamadriz/friendly-snippets" }

	-- Syntax
	use { "NMAC427/guess-indent.nvim", config = "require('guess-indent').setup{}" }
	use { "neoclide/vim-jsx-improve", ft = { 'javascript', 'javascriptreact' } }
	use { "joshua7v/vim-tsx-improve", ft = { 'typescript', 'typescriptreact' } }
	use { "MunifTanjim/prettier.nvim", config = "require 'plugins.prettier'" }
	-- Treesitter
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = "require 'plugins.treesitter'" }
	use { "nvim-treesitter/nvim-treesitter-context" }
	use { "JoosepAlviste/nvim-ts-context-commentstring", config = "require 'plugins.comment'", after = "nvim-treesitter" }
	use { "p00f/nvim-ts-rainbow" }
	use { "windwp/nvim-autopairs", config = "require 'plugins.autopairs'" }
	use { "windwp/nvim-ts-autotag" }

	-- Comments
	use { "LudoPinelli/comment-box.nvim", config = "require 'plugins.comment-box'" }
	use { "numToStr/Comment.nvim", config = "require 'plugins.comment'" }

	-- Navigation
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }, config = "require 'plugins.nvim-tree'" }

	use { "nvim-telescope/telescope.nvim", config = "require 'plugins.telescope'" }
	use { 'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
	use { 'nvim-telescope/telescope-symbols.nvim' }

	-- Debugging
	use { "akinsho/toggleterm.nvim",
		config = "require 'plugins.toggleterm'" }

	-- Visuals
	use { 'ojroques/nvim-hardline', config = "require 'plugins.hardline'" }
	use { "norcalli/nvim-colorizer.lua", config = "require'colorizer'.setup()" }
	use { "lukas-reineke/indent-blankline.nvim", config = "require 'plugins.indentline'" }

	-- Git
	use { "lewis6991/gitsigns.nvim", config = "require 'plugins.gitsigns'" }

	-- Vanilla
	use { "qiushihe/vim-bbye" }
	use { "tpope/vim-surround" }
	use { "tpope/vim-repeat" }
	use { "folke/zen-mode.nvim", cmd = { 'ZenMode' } }
	use { "lambdalisue/suda.vim" }
	use { "godlygeek/tabular" }

	-- Miscellaneous
	use { "vimwiki/vimwiki", config = "require 'plugins.vimwiki'", ft = { 'vimwiki', 'markdown' } }
	use { "folke/which-key.nvim", config = "require 'plugins.whichkey'" }
end)
