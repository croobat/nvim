--[[
comment config mappings file to avoid overrides:
~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/plugins/editor.lua
]]
--
return {
	{
		"folke/which-key.nvim",
		opts = {
			plugins = {
				marks = true,
				registers = true,
				spelling = {
					enabled = true,
					suggestions = 20,
				},
				presets = {
					operators = false,
					motions = false,
					text_objects = false,
					windows = true,
					nav = true,
					z = true,
					g = true,
				},
			},
			icons = {
				breadcrumb = ">>",
				separator = "->",
				group = "+",
			},
			-- popup_mappings = {
			-- 	scroll_down = "<c-j>",
			-- 	scroll_up = "<c-k>",
			-- },
			-- window = {
			-- 	border = "rounded",
			-- 	position = "bottom",
			-- 	margin = { 1, 0, 1, 0 },
			-- 	padding = { 2, 2, 2, 2 },
			-- 	winblend = 0,
			-- },
			layout = {
				height = { min = 4, max = 25 },
				width = { min = 20, max = 50 },
				spacing = 2,
				align = "left",
			},
			-- ignore_missing = true,
			-- hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " },
			show_help = true,
			-- triggers = "auto",
			-- triggers_blacklist = {
			-- 	i = { "j", "k" },
			-- 	v = { "j", "k" },
			-- },
			spec = {
				{
					mode = { "n", "v" },
					{ "<leader>,",     "A,<esc>",                                        desc = "Append comma",            nowait = true, remap = false },
					{ "<leader>;",     "A;<esc>",                                        desc = "Append semicolon",        nowait = true, remap = false },
					{ "<leader><tab>", group = "tabs",                                   desc = '',                        nowait = true, remap = false },
					{ "<leader>Q",     "<cmd>:BufferLineCloseOthers<cr>",                desc = "Close Other Buffers",     nowait = true, remap = false },
					{ "<leader>W",     "<cmd>SudaWrite<cr>",                             desc = "Save (sudo)",             nowait = true, remap = false },
					{ "<leader>[",     group = "prev",                                   desc = '',                        nowait = true, remap = false },
					{ "<leader>]",     group = "next",                                   desc = '',                        nowait = true, remap = false },
					{ "<leader>a",     group = "Auto-options",                           desc = '',                        nowait = true, remap = false },
					{ "<leader>aC",    "<cmd>setlocal formatoptions-=cro<cr>",           desc = "Auto-comment off",        nowait = true, remap = false },
					{ "<leader>aF",    "<cmd>set foldmethod=marker<cr>",                 desc = "Fold mark",               nowait = true, remap = false },
					{ "<leader>aH",    "<cmd>nohlsearch<cr>",                            desc = "Highlight off",           nowait = true, remap = false },
					{ "<leader>aI",    "<cmd>setlocal noautoindent<cr>",                 desc = "Auto-indent off",         nowait = true, remap = false },
					{ "<leader>aL",    "<cmd>set colorcolumn=0<cr>",                     desc = "Color column off",        nowait = true, remap = false },
					{ "<leader>aT",    "<cmd>set shiftwidth=4 tabstop=4<cr>",            desc = "Indent 4 spaces",         nowait = true, remap = false },
					{ "<leader>ac",    "<cmd>setlocal formatoptions+=cro<cr>",           desc = "Auto-comment on",         nowait = true, remap = false },
					{ "<leader>af",    "<cmd>set foldmethod=indent<cr>",                 desc = "Fold indent",             nowait = true, remap = false },
					{ "<leader>ah",    "<cmd>lua vim.opt.hlsearch = true<cr>",           desc = "Highlight on",            nowait = true, remap = false },
					{ "<leader>ai",    "<cmd>setlocal autoindent<cr>",                   desc = "Auto-indent on",          nowait = true, remap = false },
					{ "<leader>al",    "<cmd>set colorcolumn=79<cr>",                    desc = "Color column on",         nowait = true, remap = false },
					{ "<leader>as",    "<cmd>%s/\\s\\+$//e<cr>",                         desc = "Remove traling spaces",   nowait = true, remap = false },
					{ "<leader>at",    "<cmd>set shiftwidth=2 tabstop=2<cr>",            desc = "Indent 2 spaces",         nowait = true, remap = false },
					{ "<leader>ax",    "<cmd>ColorizerToggle<cr>",                       desc = "Hex colors toggle",       nowait = true, remap = false },
					{ "<leader>b",     group = "buffer",                                 desc = '',                        nowait = true, remap = false },
					{ "<leader>c",     group = "code",                                   desc = '',                        nowait = true, remap = false },
					{ "<leader>d",     '"_d',                                            desc = "Delete withouth yanking", nowait = true, remap = false },
					{ "<leader>f",     group = "file/find",                              desc = '',                        nowait = true, remap = false },
					{ "<leader>fe",    "<cmd>EslintFixAll<cr>",                          desc = "Eslint fix code",         nowait = true, remap = false },
					{ "<leader>ff",    "<cmd>lua LazyVim.format({ force = true })<cr>",  desc = "Format code",             nowait = true, remap = false },
					{ "<leader>g",     group = "goto (git)",                             desc = '',                        nowait = true, remap = false },
					{ "<leader>gR",    "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer",            nowait = true, remap = false },
					{ "<leader>gh",    group = "hunks",                                  desc = '',                        nowait = true, remap = false },
					{ "<leader>gj",    "<cmd>lua require('gitsigns').next_hunk()<cr>",   desc = "Next Hunk",               nowait = true, remap = false },
					{ "<leader>gk",    "<cmd>lua require('gitsigns').prev_hunk()<cr>",   desc = "Previous Hunk",           nowait = true, remap = false },
					{ "<leader>gr",    "<cmd>lua require 'gitsigns'.reset_hunk()<cr>",   desc = "Reset Hunk",              nowait = true, remap = false },
					{ "<leader>gs",    group = "surround",                               desc = '',                        nowait = true, remap = false },
					{ "<leader>gs",    "<cmd>lua require 'gitsigns'.stage_hunk()<cr>",   desc = "Stage Hunk",              nowait = true, remap = false },
					{ "<leader>q",     group = "quit/session",                           desc = '',                        nowait = true, remap = false },
					{ "<leader>s",     group = "search",                                 desc = '',                        nowait = true, remap = false },
					{ "<leader>u",     group = "ui",                                     desc = '',                        nowait = true, remap = false },
					{ "<leader>w",     "<cmd>w!<cr>",                                    desc = "Save",                    nowait = true, remap = false },
					{ "<leader>x",     group = "diagnostics/quickfix",                   desc = '',                        nowait = true, remap = false },
					{ "<leader>z",     group = "fold",                                   desc = '',                        nowait = true, remap = false },
				},
			},
			config = function(_, opts)
				local wk = require("which-key")
				wk.setup(opts)
				-- wk.register(opts.defaults)
			end,
		},
	},
}
