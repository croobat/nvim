local nvim_tree = require("nvim-tree")
local nvim_web_devicons = require("nvim-web-devicons")
local nvim_tree_config = require("nvim-tree.config")

nvim_tree.setup({
	hijack_cursor = true,
	respect_buf_cwd = true,
	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, action = "edit" },
				{ key = "h", action = "close_node" },
				{ key = "u", action = "dir_up" },
				{ key = "v", action = "vsplit" },
			},
		},
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


vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
