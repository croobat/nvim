-- :help options

o = vim.opt

local options = {
  backup = false,                           -- creates a backup file
  clipboard = "unnamedplus",                -- allows neovim to access the system clipboard
  cmdheight = 1,                            -- space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" },  -- mostly just for cmp
  conceallevel = 0,                         -- `` visible md files
  fileencoding = "utf-8",                   -- the encoding written to a file
  hlsearch = false,                         -- highlight matches prev search
  ignorecase = true,                        -- ignore case in search patterns
  mouse = "a",                              -- allow mouse
  pumheight = 10,                           -- smaller pop up menu height
  showmode = false,                         --  -- INSERT --
  showtabline = 1,                          -- show tabs if >=2
  smartcase = true,                         -- smart case
  smartindent = true,                       -- make indenting smarter again
  autoindent = true,
  splitbelow = true,                        -- horizontal splits to go below current window
  splitright = true,                        -- vertical splits to go to the right of current window
  swapfile = false,                         -- creates a swapfile
  termguicolors = true,                     -- set term gui colors (most terminals support this)
  timeoutlen = 200,                         -- time to wait for a mapped sequence to complete
  undofile = true,                          -- disable persistent undo
  updatetime = 300,                         -- faster completion (4000ms default)
  writebackup = false,                      -- if a file is being edited it cant be edited at same time
  expandtab = true,                         -- convert tabs to spaces
  shiftwidth = 2,                           -- the number of spaces inserted for each indentation
  tabstop = 2,                              -- insert 2 spaces for a tab
  cursorline = true,                        -- highlight the current line
  number = true,                            -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 2,                          -- set number column width to 2 {default 4}
  signcolumn = "yes",                       -- always show the sign colum
  wrap = false,                             -- display lines as one long line
  lisp = true,                              -- indentation when line break
  scrolloff = 8,                            -- minimum distance cursor-border
  sidescrolloff = 8,
  guifont = "JetBrainsMono Nerd Font:h13",  -- the font used in graphical neovim applications
  fdm = "marker",				                    -- Marker fold method {{{}}}
  wildmode = "longest,full"                 -- Better tab completion
}

for k, v in pairs(options) do               -- abreviando vim.opt.x con local options y o
  o[k] = v
end

o.shm:append "TIc"				        -- Disable start screen, truncate long msg, dont give ins-completion menu
o.list.lcs = "tab:|"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[[set iskeyword+=-]]

vim.cmd("autocmd BufEnter * set formatoptions-=cro") -- Disable auto command new line
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

