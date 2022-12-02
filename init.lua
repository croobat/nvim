-- require "impatient"

require "core.options"
require "core.keymaps"
require "core.autocommands"
require "plugins"

require "color.tokyonight"

vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
