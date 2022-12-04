local luasnip= require "luasnip"
local types = require "luasnip.util.types"

luasnip.config.set_config {
    -- Remember last snippet
    history = true,

    -- Update dynamic snips in real time
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnidsfdsfppets = true,

    --Cool highlights
    -- #vid3
    -- ext_opts = nil
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<-", "Error" } }
            },
        },
    },
}

-- Load snippets
-- Lazy load VSlike (friendly snippets)
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
