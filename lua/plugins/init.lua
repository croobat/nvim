--## Setup ## {{{
packer = require('packer')

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
        -- CMP

	use { "folke/which-key.nvim", config = "require 'plugins.config.whichkey'" }

    -- Syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = "require 'plugins.config.treesitter'"
    }
	use { "NMAC427/guess-indent.nvim", config = "require('guess-indent').setup{}"}
    use { "windwp/nvim-autopairs", config = "require 'plugins.config.autopairs'" }

    -- Navigation
    use { 'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = "require 'plugins.config.nvim-tree'" }

    use { "nvim-telescope/telescope.nvim",
        config = "require 'plugins.config.telescope'" }
    use {'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { 'nvim-telescope/telescope-symbols.nvim' }

    -- Debugging
	use { "akinsho/toggleterm.nvim", 
        config = "require 'plugins.config.toggleterm'" }

    -- Visuals

    -- Vanilla

    -- Miscellaneous

	--## EOF ## {{{
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
--}}}
