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
        -- ["<CR>"] = "RET",
        -- ["<tab>"] = "TAB",
    },
    icons = {
        breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
        separator = "->", -- symbol used between a key and it's label
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
} --}}}


local opts = { --{{{
    -- Leader keys
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
} --}}}

local mappings = {
    [","] = { "A,<esc>", "Insert comma" },
    ["."] = { "A.<esc>", "Insert dot" },
    [";"] = { "A;<esc>", "Insert semicolon" },
    ["="] = { "A = ", "Insert equal" },
    ["/"] = { "<cmd>Telescope live_grep<CR>", "Find text" },
    ["?"] = { "<cmd>Telescope find_files<CR>", "Find Files" },
    ["<leader>"] = { "i <esc>l", "Insert space" },

    -- L = latex
    ["Q"] = { "<cmd>:Bdeleteexcept<CR><cmd>NvimTreeToggle<CR><cmd>NvimTreeToggle<CR>", "Close Other Buffers" },

    -- a = auto-options
    -- c = comment box
    ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
    ["f"] = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "LSP format" },
    ["F"] = { "<cmd>%s/\\s\\+$//e<CR>", "Trailing spaces" },
    -- g = git
    -- l = lsp
    ["p"] = { "<cmd>Prettier<CR>", "Prettier format" },
    ["q"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
    -- t = telescope
    ["w"] = { "<cmd>w!<CR>", "Save" },
    ["W"] = { "<cmd>SudaWrite<CR>", "Save (sudo)" },
    ["x"] = { "I* [ ] <esc>", "Insert checkbox" },
    ["z"] = { "<cmd>:ZenMode<CR>", "Zen mode" },

    --[[
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
    ]] --

    a = {
        name = "Auto-options", --{{{
        C = { "<cmd>setlocal formatoptions-=cro<CR>", "Auto-comment off" },
        F = { "<cmd>set foldmethod=marker<CR>", "Fold mark" },
        H = { "<cmd>nohlsearch<CR>", "Highlight off" },
        I = { "<cmd>setlocal noautoindent<CR>", "Auto-indent off" },
        L = { "<cmd>set colorcolumn=0<CR>", "Color column off" },
        T = { "<cmd>set shiftwidth=4 tabstop=4<CR>", "Indent 4 spaces" },
        c = { "<cmd>setlocal formatoptions+=cro<CR>", "Auto-comment on" },
        f = { "<cmd>set foldmethod=indent<CR>", "Fold indent" },
        h = { "<cmd>lua vim.opt.hlsearch = true<CR>", "Highlight on" },
        i = { "<cmd>setlocal autoindent<CR>", "Auto-indent on" },
        l = { "<cmd>set colorcolumn=79<CR>", "Color column on" },
        s = { "<cmd>%s/\\s\\+$//e<CR>", "Remove traling spaces" },
        t = { "<cmd>set shiftwidth=2 tabstop=2<CR>", "Indent 2 spaces" },
        x = { "<cmd>ColorizerToggle<CR>", "Hex colors toggle" },
    }, --}}}

    c = {
        name = "Comment Box", --{{{
        TL = { "<cmd>lua require('comment-box').cline(3)<CR>", "heavy line" },
        TT = { "<cmd>lua require('comment-box').accbox(3)<CR>", "Title Heavy" },
        a = { "<cmd>lua require('comment-box').albox(10)<CR>", "Classic ASCII" },
        l = { "<cmd>lua require('comment-box').cline(10)<CR>", "ASCII line" },
        c = { "<cmd>lua require('comment-box').albox(2)<CR>", "Classic" },
        g = { "<cmd>lua require('comment-box').catalog()<CR>", "Box Catalog" },
        h = { "<cmd>lua require('comment-box').albox(3)<CR>", "Heavy" },
        L = { "<cmd>lua require('comment-box').cline(1)<CR>", "Simple line" },
        t = { "<cmd>lua require('comment-box').accbox(7)<CR>", "Title" },
    }, --}}}

    g = {
        name = "Git", --{{{
        R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
        b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Blame" },
        B = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
        c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
        d = { "<cmd>Gitsigns diffthis HEAD<CR>", "Diff", },
        j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
        k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
        o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
        p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
        r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
        s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
        u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", "Undo Stage Hunk", },
    }, --}}}

    l = {
        name = "LSP", --{{{
        R = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
        S = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
        c = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
        d = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "List definitions" },
        f = { "<cmd>lua vim.lsp.buf.format { async = true }<CR>", "Format" },
        i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "List implementations" },
        l = { "<cmd>LspStart<CR>", "Start" },
        q = { "<cmd>lua vim.diagnostic.setloclist<CR>", "Quickfix" },
        r = { "<cmd>lua vim.lsp.buf.references()<CR>", "List references" },
        s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature help" },
        u = { "<cmd>lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with( vim.lsp.diagnostic.on_publish_diagnostics, {underline = true})<CR>",
            "enable underline" },
        U = { "<cmd>lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with( vim.lsp.diagnostic.on_publish_diagnostics, {underline = false})<CR>",
            "disable underline" },
        w = { "<cmd>Telescope lsp_workspace_diagnostics<CR>", "Workspace Diagnostics" },
    }, --}}}

    t = {
        name = "Telescope", --{{{
        C = { "<cmd>Telescope git_bcommits<CR>", "Git commits current buffer" },
        D = { "<cmd>Telescope diagnostics<CR>", "Document Diagnostics", },
        G = { "<cmd>Telescope diagnostics<CR>", "LSP diagnostics" },
        H = { "<cmd>Telescope help_tags<CR>", "Help" },
        M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
        R = { "<cmd>Telescope registers<CR>", "Registers" },
        T = { "<cmd>Telescope live_grep<CR>", "Text" },
        b = { "<cmd>Telescope git_branches<CR>", "Git branch" },
        c = { "<cmd>Telescope git_commits<CR>", "Git commit" },
        d = { "<cmd>Telescope lsp_definition<CR>", "LSP definition" },
        f = { "<cmd>Telescope find_files<CR>", "Files" },
        g = { "<cmd>Telescope tags<CR>", "Tags" },
        h = { "<cmd>Telescope oldfiles<CR>", "History files" },
        k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
        m = { "<cmd>Telescope marks<CR>", "Mark" },
        p = { "<cmd>lua require('telescope').extensions.projects.projects()<CR>", "Projects" },
        q = { "<cmd>Telescope quickfix<CR>", "LSP quickfix" },
        r = { "<cmd>Telescope lsp_references<CR>", "LSP reference" },
        t = { "<cmd>Telescope resume<CR>", "Resume search" },
    }, --}}}

}

which_key.setup(setup)
which_key.register(mappings, opts)
