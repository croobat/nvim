--## Setup ## {{{
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
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


  --                                  ╔═════════╗
  --                                  ║ PLUGINS ║
  --                                  ╚═════════╝
  -- ┏━━━━━━━━━━━━━━━━━━━━┓
  -- ┃    ## Mandatory ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━┛
  use { "lewis6991/impatient.nvim" } -- Faster startup
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by a lot of plugins

  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃   ## Completion (30ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
  --  ╭───────╮
  --  │   LSP │
  --  ╰───────╯
  -- Language Server Installer
  use "williamboman/nvim-lsp-installer"
  -- Configuration helper
  use "neovim/nvim-lspconfig"

  --  ╭───────╮
  --  │   CMP │
  --  ╰───────╯
  -- Main plugin
  use { "hrsh7th/nvim-cmp", config = "require 'tony.plug-conf.cmp'" }

  -- Sources
  use { "saadparwaiz1/cmp_luasnip" } -- Luasnip plugin
  use { "hrsh7th/cmp-nvim-lua" } -- lua API
  use { "hrsh7th/cmp-nvim-lsp" } -- LSP integrated
  use { "hrsh7th/cmp-buffer" } -- buffer words
  use { "hrsh7th/cmp-calc" } --calculator
  use { "hrsh7th/cmp-path" } -- path
  use { "hrsh7th/cmp-cmdline" } -- cmdline

  -- Snippets engine
  use { "L3MON4D3/LuaSnip", config = "require 'tony.plug-conf.luasnip'" }
  -- A bunch of snippets
  use { "rafamadriz/friendly-snippets" }

  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃   ## Navigation (10ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
  -- File manager
  use { "kyazdani42/nvim-tree.lua", requires = { 'kyazdani42/nvim-web-devicons' },
    config = "require 'tony.plug-conf.nvim-tree'" }

  -- Fuzzy finder
  use { "nvim-telescope/telescope.nvim", config = "require 'tony.plug-conf.telescope'" }
  -- Faster telescope
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  -- Telescope symbols
  use { 'nvim-telescope/telescope-symbols.nvim' }

  -- Visual buffer tabs
  use { "akinsho/bufferline.nvim", requires = { 'kyazdani42/nvim-web-devicons' }, event = "BufWinEnter",
    config = "require 'tony.plug-conf.bufferline'" }

  -- Close buffers
  use { "moll/vim-bbye" }

  -- Project manager
  use { "ahmedkhalf/project.nvim", config = "require 'tony.plug-conf.project'" }

  -- Better t and f
  use { "unblevable/quick-scope", config = "require 'tony.plug-conf.quickscope'" }

  -- Hop
  use { "phaazon/hop.nvim", branch = 'v2', config = "require 'tony.plug-conf.hop'" }

  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃   ## Visuals (40ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━┛
  -- ╭───────────────╮
  -- │    Treesitter │
  -- ╰───────────────╯
  -- Main plugin
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", event = "BufWinEnter",
    config = "require 'tony.plug-conf.treesitter'" }

  -- Rainbow parens
  use { "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" }

  -- Contextual comments
  use { "JoosepAlviste/nvim-ts-context-commentstring", config = "require 'tony.plug-conf.comment'",
    after = "nvim-treesitter" }

  --  ╭──────────╮
  --  │   Colors │
  --  ╰──────────╯
  -- Colorscheme
  use { 'folke/tokyonight.nvim' }
  -- CSV highlighting
  use 'mechatroner/rainbow_csv'
  -- Visual hex colors
  use { "norcalli/nvim-colorizer.lua", config = "require'colorizer'.setup()" }

  --  ╭─────────╮
  --  │   Icons │
  --  ╰─────────╯
  -- Extra icons
  use 'kyazdani42/nvim-web-devicons' --extra icons

  --  ╭────────────╮
  --  │   Cosmetic │
  --  ╰────────────╯
  -- Info line
  use { "nvim-lualine/lualine.nvim", requires = { 'kyazdani42/nvim-web-devicons', opt = true }, event = "BufWinEnter",
    config = "require 'tony.plug-conf.lualine'" }

  -- Start page
  use { "goolord/alpha-nvim", config = "require 'tony.plug-conf.alpha'" }

  -- Git symbols
  use { "lewis6991/gitsigns.nvim", config = "require 'tony.plug-conf.gitsigns'" }

  -- Indented visual lines
  use { "lukas-reineke/indent-blankline.nvim", config = "require 'tony.plug-conf.indentline'", event = "BufRead" } --indent lines

  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃    ## Vanilla (<10ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━┛
  -- Motions
  use "tpope/vim-surround" -- Surround
  use "tpope/vim-repeat" -- Repeat
  use { "sQVe/sort.nvim", cmd = { 'Sort' } }

  --(Replace without overlap) gr motion
  use "vim-scripts/ReplaceWithRegister"

  -- Targets
  use "kana/vim-textobj-user" -- custom text objects
  use "michaeljsmith/vim-indent-object" -- indent (ai, ii)
  use "kana/vim-textobj-entire" -- entire (ae, ie)
  use "kana/vim-textobj-line" -- significant line
  use "wellle/targets.vim"

  -- Inserters
  use { "windwp/nvim-autopairs", config = "require 'tony.plug-conf.autopairs'" }
  use { "windwp/nvim-ts-autotag", event = "InsertEnter" } --autoclose tags

  -- Comments
  use { "LudoPinelli/comment-box.nvim", config = "require 'tony.plug-conf.comment-box'" }
  use { "numToStr/Comment.nvim", config = "require 'tony.plug-conf.comment'" }

  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃   ## Miscellaneous (10ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
  -- Toggle terminal
  use { "akinsho/toggleterm.nvim", config = "require 'tony.plug-conf.toggleterm'" }
  -- Zen mode
  use { "folke/zen-mode.nvim", cmd = { 'ZenMode' } }
  -- Keymap reminder
  use { "folke/which-key.nvim", config = "require 'tony.plug-conf.whichkey'" }
  -- Vim wiki
  use { "vimwiki/vimwiki", config = "require 'tony.plug-conf.vimwiki'" }
  -- Sudo privileges
  use { "lambdalisue/suda.vim" }

--  ┏━━━━━━━━━━━━━━━┓
--  ┃   ## Local ## ┃
--  ┗━━━━━━━━━━━━━━━┛
  use "/home/tony/Development/low-dev/stack_map.nvim"

  --## EOF ## {{{
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
--}}}
