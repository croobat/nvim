local nvim_tree = require("nvim-tree")
local nvim_web_devicons = require("nvim-web-devicons")

local function my_on_attach(bufnr)
	local api = require "nvim-tree.api"

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	-- default mappings
	api.config.mappings.default_on_attach(bufnr)

	-- custom mappings
	vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set('n', 'l', api.node.open.edit, opts("edit"))
	vim.keymap.set('n', 'u', api.node.navigate.parent, opts("parent"))
	vim.keymap.set('n', 'v', api.node.open.vertical, opts("vsplit"))
	vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts("close parent"))
end

nvim_tree.setup({
	on_attach = my_on_attach,
	hijack_cursor = true,
	respect_buf_cwd = true,
	view = {
		adaptive_size = true,
	},
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	git = {
		ignore = false,
	},
	actions = {
		open_file = {
			quit_on_open = true,
		},
	},
	renderer = {
		highlight_git = true,
		root_folder_label = ":t",
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "S",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
			show = {
				git = true,
				folder = true,
				file = true,
				folder_arrow = true,
			}
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "i",
			info = "?",
			warning = "w",
			error = "x",
		}
	}
})

nvim_web_devicons.setup {
	override = {
		zsh = {
			icon = "",
			color = "#428850",
			cterm_color = "65",
			name = "Zsh"
		}
	},
	default = true,
}
