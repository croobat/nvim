require "impatient"

require "core.options"
require "core.keymaps"
require "core.autocommands"
require "plugins"

require "color.tokyonight"

vim.api.nvim_set_keymap("n", "<leader>/", ":Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>?", ":Telescope find_files<cr>", { noremap = true, silent = true })
