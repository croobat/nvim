local configs = require("nvim-treesitter.configs")

vim.g.loaded_tree_sitter = 1

configs.setup {
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,
		use_languagetree = false,
	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		colors = { '#e0af68', '#f7768e', '#2ac3de', '#bb9af7', '#9ece6a' },
	},
	indent = {
		enable = true,
	},
}
