local configs = require("nvim-treesitter.configs")
local ts_context = require("treesitter-context")

configs.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "" }, -- List of parsers to ignore installing
    autotag = {
        enable = true,
    },
    autopairs = {
        enable = true;
    },
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = { "" }, -- list of language that will be disabled
        additional_vim_regex_highlighting = true,

    },

    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        colors = {'#e0af68','#f7768e','#2ac3de','#bb9af7','#9ece6a'}, -- gui hex colors
    },

    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    }
}

ts_context.setup {}
