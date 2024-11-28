--[[
Options are automatically loaded before lazy.nvim startup
Default options that are always set:
https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
Add any additional options here (redundant with lazyvim are commented out)
]]
--
local font = "Recursive Mono Linear Static:h8"
local bashcomp = "longest,full"
local opt = vim.opt

-- vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.g.loaded_ruby_provider = 0
vim.g.autoformat = false

local options = {
  -- System
  backup = false, -- System backups
  swapfile = false, -- Swapfile for buffer files
  clipboard      = vim.env.SSH_TTY and "" or "unnamedplus", -- System clipboard
  fileencoding = "utf-8", -- Encoding
  mouse = "a", -- Enable mouse
  undofile = true, -- Persistent undo upon exit
  writebackup = false, -- Backup while editing file
  title = true, -- custom title
  autowrite = false, -- Auto write buffer when switching
  confirm = true, -- Confirm to save changes

  -- Tabs
  expandtab = false, -- Turn tabs into spaces
  -- expandtab = true, -- Turn tabs into spaces
  smarttab = true, -- Detect number of spaces per tab
  tabstop = 2, -- Number of spaces a tab counts for
  softtabstop = 2, -- Number of spaces a tab counts for (editing)
  shiftwidth = 2, -- Number of spaces per auto indent

  -- Indentation
  smartindent = true, -- Sensible indenting
  autoindent = true, -- Tab when jump from indented line
  lisp = false, -- Indent when line breaks
  foldmethod = "marker", -- Folding with {{{}}}
  formatoptions = "jqlnt", -- Autoformat options (remove auto comment)

  -- Interface
  cmdheight = 1, -- Space to show cmd messages
  pumheight = 10, -- Pop-up menu height
  showtabline = 1, -- Show tabs if more than 1
  splitbelow = true, -- Horizontal splits go below window
  splitright = true, -- Vertical splits go to the right of window
  textwidth = 0, -- Character column limit
  wrap = false, -- Start with text wrapped
  scrolloff = 8, -- Min distance from top-down borders
  sidescrolloff = 0, -- Min distance from left-right borders
  colorcolumn = "100", -- Column to show color

  -- Left column
  number = true, -- Numbered lines
  relativenumber = true, -- Numbered line relative to cursor
  numberwidth = 2, -- Column width
  signcolumn = "yes", -- When to show sign columns

  -- Visuals
  showbreak = " .. ", -- Shown when line breaks
  guifont = font, -- Font in graphical applications
  conceallevel = 0, -- Don't hide special text (ie json "")
  showmode = false, -- Mode warnings on interface
  termguicolors = true, -- 24-bit RGB color
  cursorline = true, -- Highlight current line
  list = true, -- Enable listchars

  -- Search
  hlsearch = false, -- Highlighting
  ignorecase = true, -- Case insensitive patterns
  smartcase = true, -- Case sensitive only if there are caps

  -- Completion
  completeopt = "menu,menuone,noselect", -- Completion options
  timeoutlen = 300, -- ms to wait for mapped sequence
  updatetime = 200, -- Faster completion
  wildmode = bashcomp, -- Tab completion behaviour
  spell = false, -- Spelling check
  spelllang = "en,es", -- Spelling check language
}

for k, v in pairs(options) do
  opt[k] = v
end

-- Append options
opt.shm:append("Ic") -- Disable start screen and certain warnings

-- Vim commands
-- Special chars for nbsp, tab and trailing space asdf asdf ads fsadf sd fasd fads fads fsad fdsa fas fadsf adsf asd fdsaf sadf dsaf
opt.listchars = { tab = "│ ", trail = "·", precedes = "<", extends = ">", nbsp = "○" }

-- Keys that move to next wrapped line
vim.cmd("set whichwrap+=<,>,[,],h,l")

-- Recursive finds
vim.cmd("set path+=**")

-- New word delimitators
vim.cmd("set iskeyword+=^-,^_")
