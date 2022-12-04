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
    use { "hrsh7th/nvim-cmp", config = "require 'plugins.cmp'" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-cmdline" }
    use { "petertriho/cmp-git" }
    use { "dcampos/cmp-emmet-vim", requires = "mattn/emmet-vim" }

    use { "L3MON4D3/LuaSnip", config = "require 'plugins.luasnip'" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "rafamadriz/friendly-snippets" }

    -- Syntax
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
        config = "require 'plugins.treesitter'"
    }
    use { "NMAC427/guess-indent.nvim", config = "require('guess-indent').setup{}"}
    use { "windwp/nvim-autopairs", config = "require 'plugins.autopairs'" }

    -- Comments
    use { "LudoPinelli/comment-box.nvim", config = "require 'plugins.comment-box'" }
    use { "numToStr/Comment.nvim", config = "require 'plugins.comment'" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", config = "require 'plugins.comment'",
        after = "nvim-treesitter" }

    -- Navigation
    use { 'nvim-tree/nvim-tree.lua',
        requires = { 'nvim-tree/nvim-web-devicons' },
        config = "require 'plugins.nvim-tree'" }

    use { "nvim-telescope/telescope.nvim",
        config = "require 'plugins.telescope'" }
    use {'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { 'nvim-telescope/telescope-symbols.nvim' }

    -- Debugging
    use { "akinsho/toggleterm.nvim",
        config = "require 'plugins.toggleterm'" }

    -- Visuals
    use {'ojroques/nvim-hardline',
        config = "require 'plugins.hardline'" }
    use { "lewis6991/gitsigns.nvim", config = "require 'plugins.gitsigns'" }
    use { "norcalli/nvim-colorizer.lua", config = "require'colorizer'.setup()" }
    use { "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" }
    use { "lukas-reineke/indent-blankline.nvim", config = "require 'plugins.indentline'" }

    -- Vanilla
    use { "qiushihe/vim-bbye" }
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use { "tpope/vim-fugitive" }
    use { "folke/zen-mode.nvim", cmd = { 'ZenMode' } }
    use { "lambdalisue/suda.vim" }

    -- Miscellaneous
    use { "vimwiki/vimwiki", config = "require 'plugins.vimwiki'" }
    use { "folke/which-key.nvim", config = "require 'plugins.whichkey'" }

    --## EOF ## {{{
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then

        require("packer").sync()
    end
end)
--}}}
