-- Setup{{{
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = false, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}--}}}


local opts = {--{{{
  -- Leader keys
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}--}}}

local mappings = {
  [","] = { "A,<esc>", "Insert comma" },
  ["."] = { "A.<esc>", "Insert dot" },
  [";"] = { "A;<esc>", "Insert semicolon" },
  ["/"] = { "<cmd>Telescope live_grep<cr>", "Find text" },  --Find text
  ["?"] = { "<cmd>Telescope find_files<cr>", "Find Files" },  --Find files
  ["<leader>"] = { "i <esc>l", "Insert space" },

  -- L = latex
  ["Q"] = { "<cmd>:Bdeleteexcept<CR>", "Close Other Buffers" },      --Close buffer
  -- S = spellcheck
  -- T = terminal

  -- a = auto-options
  -- c = comment box
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },    --Explorer
  -- g = git
  -- l = lsp
  ["q"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },      --Close buffer
  -- t = telescope
  ["w"] = { "<cmd>w!<CR>", "Save" },                    --Save
  ["W"] = { "<cmd>SudaWrite<CR>", "Save (sudo)" },      --Save
  ["x"] = { "I* [ ] <esc>", "Insert checkbox" },
  ["z"] = { "<cmd>:ZenMode<cr>", "Zen mode" },

  L = {
    name = "Latex",--{{{
    I = {"", "Info full"},
    X = {"", "Reload state"},
    a = {"", "Context menu"},
    i = {"", "Info"},
    q = {"", "Log"},
    s = {"", "Toggle main"},
    x = {"", "Reload"},

    C = {"", "Clean full"},
    G = {"", "Status all"},
    K = {"", "Stop all"},
    L = {"", "Compile"},
    c = {"", "Clean auxiliary files"},
    e = {"", "Show errors"},
    g = {"", "Status"},
    k = {"", "Stop"},
    l = {"", "Compile selected"},
    o = {"", "Compile output"},

    T = {"", "Toc toggle"},
    m = {"", "Imaps list"},
    r = {"", "Reverse search"},
    t = {"", "TOC open"},
    v = {"", "View"},

    lc = {"<cmd>VimtexCountLetters", "Letter count"},
    wc = {"<cmd>VimtexCountWords", "Word count"},
  },--}}}

  S = {
    name = "Spell Check",--{{{
    e = {"<cmd>lua vim.cmd 'setlocal spell! spelllang=en_us'<cr>", "Toggle English"},
    s = {"<cmd>lua vim.cmd 'setlocal spell! spelllang=es_es'<cr>", "Toggle Spanish"},
  },--}}}

  T = {
    name = "Terminal",--{{{
    T = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Vterminal" },
    t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
    f = { "<cmd>ToggleTerm direction=float<cr>", "Float terminal" },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Git" },
    h = { "<cmd>ToggleTerm size=15 direction=horizontal<cr>", "Hterminal" },
    l = { "<cmd>lua _LIVESERVER_TOGGLE()<cr>", "HTML server" },
    n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
    p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
    u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
    v = { "<cmd>ToggleTerm size=60 direction=vertical<cr>", "Vertical" },
  },--}}}

  a = {
    name = "Auto-options",--{{{
  C = { "<cmd>lua vim.cmd'setlocal formatoptions-=cro'<cr>", "Auto-comment off" },
  H = { "<cmd>nohlsearch<CR>", "Highlight off" },    --Disable hl search
  I = { "<cmd>lua vim.cmd'setlocal noautoindent'<cr>", "Auto-indent off" },
  L = { "<cmd>lua vim.cmd'set colorcolumn=0'<cr>", "Color column off" },
  T = { "<cmd>lua vim.cmd'set shiftwidth=2 tabstop=2'<cr>", "Indent 2 spaces" },
  c = { "<cmd>lua vim.cmd'setlocal formatoptions+=cro'<cr>", "Auto-comment on" },
  h = { "<cmd>lua vim.opt.hlsearch = true<CR>", "Highlight on" },      --Enable hl search
  i = { "<cmd>lua vim.cmd'setlocal autoindent'<cr>", "Auto-indent on" },
  l = { "<cmd>lua vim.cmd'set colorcolumn=80'<cr>", "Color column on" },
  t = { "<cmd>lua vim.cmd'set shiftwidth=4 tabstop=4'<cr>", "Indent 4 spaces" },
  x = { "<cmd>ColorizerToggle<cr>", "Hex colors toggle" },    --Explorer

  },--}}}

  c = {
    name = "Comment Box",--{{{
    L = { "<cmd>lua require('comment-box').cline(2)<cr>", "heavy line" },
    T = { "<cmd>lua require('comment-box').accbox(3)<cr>", "Title Heavy" },
    ab = { "<cmd>lua require('comment-box').albox(10)<cr>", "Classic ASCII" },
    al = { "<cmd>lua require('comment-box').cline(10)<cr>", "ASCII line" },
    c = { "<cmd>lua require('comment-box').albox()<cr>", "Classic" },
    g = { "<cmd>lua require('comment-box').catalog()<cr>", "Box Catalog" },
    h = { "<cmd>lua require('comment-box').albox(3)<cr>", "Heavy" },
    l = { "<cmd>lua require('comment-box').cline(1)<cr>", "Simple line" },
    t = { "<cmd>lua require('comment-box').accbox(7)<cr>", "Title" },
  },--}}}

  g = {
    name = "Git",--{{{
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff", },
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
  },--}}}

  l = {
    name = "LSP",--{{{
    R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    S = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    c = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    d = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "List definitions" },
    f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "List implementations" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic", },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
    l = { "<cmd>LspStart<cr>", "Start" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
    w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics", },
  },--}}}

  t = {
    name = "Telescope",--{{{
    C = { "<cmd>Telescope git_bcommits<cr>", "Git commits current buffer" },
    D = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics", },
    G = { "<cmd>Telescope diagnostics<cr>", "LSP diagnostics" },
    H = { "<cmd>Telescope help_tags<cr>", "Help" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    T = { "<cmd>Telescope live_grep<cr>", "Text" },
    b = { "<cmd>Telescope git_branches<cr>", "Git branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Git commit" },
    d = { "<cmd>Telescope lsp_definition<cr>", "LSP definition" },
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    g = { "<cmd>Telescope tags<cr>", "Tags" },
    h = { "<cmd>Telescope oldfiles<cr>", "History files" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope marks<cr>", "Mark" },
    p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
    q = { "<cmd>Telescope quickfix<cr>", "LSP quickfix" },
    r = { "<cmd>Telescope lsp_references<cr>", "LSP reference" },
    t = { "<cmd>Telescope resume<cr>", "Resume search" },
  },--}}}

}

which_key.setup(setup)
which_key.register(mappings, opts)
