-- if vim.g.snippets ~= "luasnip" then
--   return
-- end

local ls= require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
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
