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
		priority = 1000,
	},

	-- Mandatory
	{ "lewis6991/impatient.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "nvim-lua/plenary.nvim" },

	-- Vanilla
	{ "qiushihe/vim-bbye" },
	{ "tpope/vim-surround" },
	{ "tpope/vim-repeat" },
	{ "folke/zen-mode.nvim", cmd = { 'ZenMode' } },
	{ "lambdalisue/suda.vim" },
	{ "godlygeek/tabular" },
	{ "felipec/vim-sanegx", event = "BufRead" },
	{ "wellle/targets.vim" },

	-- Miscellaneous
	{ "folke/which-key.nvim", config = function() require "plugins.whichkey" end, }
})
