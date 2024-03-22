require("copilot").setup({
	panel = {
		auto_refresh = true,
	},
	suggestion = {
		auto_trigger = true,
		debounce = 25,
		keymap = {
			accept = "<M-l>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-]>",
		},
	},
	filetypes = {
		yaml = true,
		markdown = true,
		help = true,
		gicommit = true,
		gitrebase = true,
		hgcommit = true,
		svn = true,
		cvs = false,
		json = true,
	},
})
