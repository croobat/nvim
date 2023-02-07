-- Setup auto-pairs
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

npairs.setup {
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "PmenuSel",
		highlight_grey = "LineNr",
	},
}

-- ╭──────────────╮
-- │ Custom rules │
-- ╰──────────────╯
local Rule = require'nvim-autopairs.rule'
local cond = require'nvim-autopairs.conds'

npairs.add_rules {
-- Auto space
	Rule(' ', ' ')
		:with_pair(function (opts)
			local pair = opts.line:sub(opts.col - 1, opts.col)
			return vim.tbl_contains({ '()', '[]', '{}' }, pair)
		end),
	Rule('( ', ' )')
			:with_pair(function() return false end)
			:with_move(function(opts)
					return opts.prev_char:match('.%)') ~= nil
			end)
			:use_key(')'),
	Rule('{ ', ' }')
			:with_pair(function() return false end)
			:with_move(function(opts)
					return opts.prev_char:match('.%}') ~= nil
			end)
			:use_key('}'),
	Rule('[ ', ' ]')
			:with_pair(function() return false end)
			:with_move(function(opts)
					return opts.prev_char:match('.%]') ~= nil
			end)
			:use_key(']'),
}

-- Setup cmp integration
-- local cmp_autopairs = require "nvim-autopairs.completion.cmp"
-- local cmp_status_ok, cmp = pcall(require, "cmp")
-- if not cmp_status_ok then
-- return
-- end
-- cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })
