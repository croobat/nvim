local configs = require("nvim-treesitter.configs")

configs.setup {
	-- ensure_installed = "all",
	-- ignore_install = { "smali" },
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true;
	},
	highlight = {
		enable = true,
		disable = { "" },
		additional_vim_regex_highlighting = true,

	},
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
		colors = {'#e0af68','#f7768e','#2ac3de','#bb9af7','#9ece6a'},
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	}
}
