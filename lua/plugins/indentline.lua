local indent_blankline = require("indent_blankline")

vim.wo.colorcolumn = "99999"

indent_blankline.setup({
	context_char = "┆",
	show_current_context = true,
	show_current_context_start = false,
	show_current_context_start_on_current_line = false,
	show_first_indent_level = true,
	max_indent_increase = 2,
	show_trailing_blankline_indent = false,
	filetype_exclude = {
		"lspinfo", "packer", "checkhealth", "help", "man", "startify",
		"dashboard", "neogitstatus", "NvimTree", "Trouble", "text",
	},
	context_patterns = {
		"class", "return", "function", "method", "^if", "^while",
		"jsx_element", "^for", "^object", "^table", "block", "arguments",
		"if_statement", "else_clause", "jsx_element", "jsx_self_closing_element",
		"try_statement", "catch_clause", "import_statement", "operation_type",
	},
})
