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

return packer.startup(function(use)
  --}}}
  --                                  ╔═════════╗
  --                                  ║ PLUGINS ║
  --                                  ╚═════════╝
  -- ┏━━━━━━━━━━━━━━━━━━━━┓
  -- ┃    ## Mandatory ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━┛
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by a lot of plugins
  -- use { "lewis6991/impatient.nvim" } -- Faster startup
  --


  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃   ## Completion (30ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

  -- use { "github/copilot.vim" }

  -- ╭────────╮
  -- │    LSP │
  -- ╰────────╯
  -- Main plugin
  -- use { "hrsh7th/cmp-nvim-lsp" }

  -- Language Server Installer
  -- use "williamboman/nvim-lsp-installer"

  -- Set of cool LSP settings
  -- use "tamago324/nlsp-settings.nvim"

  -- LSP handle config
  -- use { "neovim/nvim-lspconfig", config = "require 'config.lsp'" }

  -- Prettier
  -- use('MunifTanjim/prettier.nvim')

  -- ╭────────╮
  -- │    CMP │
  -- ╰────────╯
  -- Main plugin
  -- use { "hrsh7th/nvim-cmp", config = "require 'config.cmp'" }

  -- CMP sources
  -- use { "hrsh7th/cmp-buffer" } -- buffer words
  -- use { "hrsh7th/cmp-path" } -- path
  -- use { "hrsh7th/cmp-cmdline" } -- cmdline
  -- use { "hrsh7th/cmp-nvim-lua" } -- lua API
  -- use { "David-Kunz/cmp-npm" } -- npm
  -- use { "hrsh7th/cmp-calc" } --calculator

  -- ╭─────────────╮
  -- │    Snippets │
  -- ╰─────────────╯
  -- Snippets engine
  -- use { "L3MON4D3/LuaSnip", }
  -- Cmp integration
  -- use { "saadparwaiz1/cmp_luasnip" } -- cmp integration
  -- A bunch of snippets
  -- use { "rafamadriz/friendly-snippets" }

  -- use { "SirVer/ultisnips" }
  -- use { "quangnguyen30192/cmp-nvim-ultisnips" }

  -- VS Code ES7+ React/Redux...
  -- use { "mlaursen/vim-react-snippets"}

  -- Main Null-ls plugin
  -- use "jose-elias-alvarez/null-ls.nvim" -- External formatters and linters

  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃   ## Navigation (10ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
  -- File manager
  -- use { "kyazdani42/nvim-tree.lua", requires = { 'kyazdani42/nvim-web-devicons' },
    -- config = "require 'config.nvim-tree'" }

  -- Fuzzy finder
  -- use { "nvim-telescope/telescope.nvim", requires = { { 'nvim-lua/plenary.nvim' } },
    -- config = "require 'config.telescope'" }

  -- Visual buffer tabs
  -- use { "akinsho/bufferline.nvim", requires = { 'kyazdani42/nvim-web-devicons' }, event = "BufWinEnter",
    -- config = "require 'config.bufferline'" }

  -- Close buffers
  -- use { "moll/vim-bbye" }

  -- Project manager
  -- use { "ahmedkhalf/project.nvim", config = "require 'config.project'" }

  -- Better t and f
  -- use { "unblevable/quick-scope", config = "require 'config.quickscope'" }


  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃   ## Visuals (40ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━┛
-- ╭────────────────╮
-- │    Colorscheme │
-- ╰────────────────╯
  -- use "lunarvim/colorschemes" 
  use { "Mofiqul/dracula.nvim", config = "require 'colorschemes.dracula'" }
  -- use "lunarvim/darkplus.nvim" 
  -- use "navarasu/onedark.nvim"
  -- use "ellisonleao/gruvbox.nvim" 
  -- use "shaunsingh/nord.nvim"
  use { 'folke/tokyonight.nvim', config = "require 'colorschemes.tokyonight'" }

-- ╭───────────────╮
-- │    Treesitter │
-- ╰───────────────╯
  -- Main plugin
  -- use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", event = "BufWinEnter",
    -- config = "require 'config.treesitter'" }

  -- Rainbow parens
  -- use { "p00f/nvim-ts-rainbow", requires = "nvim-treesitter/nvim-treesitter" }

  -- Contextual comments
  -- use { "JoosepAlviste/nvim-ts-context-commentstring", config = "require 'config.comment'",
    -- after = "nvim-treesitter" }

-- ╭─────────────────╮
-- │   Miscellaneous │
-- ╰─────────────────╯
  -- Info line
  -- use { "nvim-lualine/lualine.nvim", requires = { 'kyazdani42/nvim-web-devicons', opt = true }, event = "BufWinEnter",
    -- config = "require 'config.lualine'" }

  -- Start page
  -- use { "goolord/alpha-nvim", config = "require 'config.alpha'" }

  -- Fix lsp doc highlight
  -- use "antoinemadec/FixCursorHold.nvim"

  -- Visual hex colors
  -- use { "norcalli/nvim-colorizer.lua", config = "require'colorizer'.setup()" }

  -- Git symbols
  -- use { "lewis6991/gitsigns.nvim", config = "require 'config.gitsigns'" }

  -- Indented visual lines
  -- use { "lukas-reineke/indent-blankline.nvim", config = "require 'config.indentline'", event = "BufRead" } --indent lines

  -- Extra icons
  -- use 'kyazdani42/nvim-web-devicons' --extra icons


  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃    ## Vanilla (<10ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━┛
  -- Motions
  -- use "tpope/vim-surround" -- Surround
  -- use "tpope/vim-commentary" -- Comment
  -- use "tpope/vim-repeat" -- Repeat
  --(Replace without overlap) gr motion
  -- use "vim-scripts/ReplaceWithRegister"

  -- Targets
  -- use "kana/vim-textobj-user" -- custom text objects
  -- use "michaeljsmith/vim-indent-object" -- indent (ai, ii)
  -- use "kana/vim-textobj-entire" -- entire (ae, ie)
  -- use "kana/vim-textobj-line" -- significant line
  -- use "wellle/targets.vim"

  -- Inserters
  -- use { "windwp/nvim-autopairs", config = "require 'config.autopairs'" }
  use { "rstacruz/vim-closer" }
  -- use { "windwp/nvim-ts-autotag", event = "InsertEnter" } --autoclose tags
  -- use { "johmsalas/text-case.nvim", config = function() require('textcase').setup {} end }
-- 
  -- Comment boxes
  use { "LudoPinelli/comment-box.nvim", config = "require 'config.comment-box'" }

  -- ┏━━━━━━━━━━━━━━━━━┓
  -- ┃   ## Compile ## ┃
  -- ┗━━━━━━━━━━━━━━━━━┛
  ---- Markdown preview
  --use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
  --  setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" },
  --  cmd = { 'MarkdownPreview' } })
  -- Latex
  -- use { "lervag/vimtex", ft = { "tex" }, config = "require 'config.vimtex'" }

  -- Codi real time completion
  -- use { 'metakirby5/codi.vim' }

  -- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
  -- ┃   ## Miscellaneous (10ms) ## ┃
  -- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
  -- Toggle terminal
  -- use { "akinsho/toggleterm.nvim", config = "require 'config.toggleterm'" }
  -- Sort selection
  -- use { "sQVe/sort.nvim", cmd = { 'Sort' } }
  -- Zen mode
  -- use { "folke/zen-mode.nvim", cmd = { 'ZenMode' } }
  -- Keymap reminder
  -- use { "folke/which-key.nvim", config = "require 'keys.whichkey'" }
  -- Vim wiki
  use { "vimwiki/vimwiki", config = "require 'config.vimwiki'" }

  --## EOF ## {{{
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
--}}}
