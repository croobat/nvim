local status_ok, hop = pcall(require, "hop")
if not status_ok then
  return
end

local keymap = vim.api.nvim_set_keymap

hop.setup {
  keys = 'etovxqpdygfblzhckisuran',
}

-- Default mappings
keymap("n", "<A-/>", ":HopPatternMW<cr>", {})
keymap("n", "<A-?>", ":HopLineStartMW<cr>", {})

