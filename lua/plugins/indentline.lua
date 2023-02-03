local indent_blankline = require("indent_blankline")

vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
vim.g.indent_blankline_filetype_exclude = {
	"help",
	"startify",
	"dashboard",
	"packer",
	"neogitstatus",
	"NvimTree",
	"Trouble",
	"text",
}
vim.g.indentLine_enabled = 1
vim.g.indent_blankline_char = "┆"
vim.g.indent_blankline_context_char = "┆"
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_show_first_indent_level = true
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_current_context = false
vim.g.indent_blankline_max_indent_increase = 1
vim.g.indent_blankline_context_patterns = {
	"class",
	"return",
	"function",
	"method",
	"^if",
	"^while",
	"jsx_element",
	"^for",
	"^object",
	"^table",
	"block",
	"arguments",
	"if_statement",
	"else_clause",
	"jsx_element",
	"jsx_self_closing_element",
	"try_statement",
	"catch_clause",
	"import_statement",
	"operation_type",
}
-- HACK: work-around for https://github.com/lukas-reineke/indent-blankline.nvim/issues/59
vim.wo.colorcolumn = "99999"

vim.cmd [[highlight IndentBlanklineContextChar guifg=#f8f8f2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent1     guifg=#8466ad gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2     guifg=#b3558b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3     guifg=#37ad55 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4     guifg=#61a2b0 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5     guifg=#b3814c gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6     guifg=#b33b3b gui=nocombine]]
vim.opt.list = true

indent_blankline.setup({
	-- show_end_of_line = true,
	space_char_blankline = " ",
	show_current_context_start_on_current_line = false,
	show_current_context_start = false,
	char_highlight_list = {
		"IndentBlanklineIndent1",
		"IndentBlanklineIndent2",
		"IndentBlanklineIndent3",
		"IndentBlanklineIndent4",
		"IndentBlanklineIndent5",
		"IndentBlanklineIndent6",
	},
})

