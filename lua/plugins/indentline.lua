local indent_blankline = require("indent_blankline")

vim.wo.colorcolumn = "99999"

-- vim.cmd [[highlight IndentBlanklineIndent1     guifg=#8466ad gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent2     guifg=#b3558b gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent3     guifg=#37ad55 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent4     guifg=#61a2b0 gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent5     guifg=#b3814c gui=nocombine]]
-- vim.cmd [[highlight IndentBlanklineIndent6     guifg=#b33b3b gui=nocombine]]

indent_blankline.setup({
	-- char = "┆",
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
	-- char_highlight_list = {
	-- 	"IndentBlanklineIndent1",
	-- 	"IndentBlanklineIndent2",
	-- 	"IndentBlanklineIndent3",
	-- 	"IndentBlanklineIndent4",
	-- 	"IndentBlanklineIndent5",
	-- 	"IndentBlanklineIndent6",
	-- },
})

