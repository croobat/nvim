local nvim_tree = require("nvim-tree")
local nvim_web_devicons = require("nvim-web-devicons")
local nvim_tree_config = require("nvim-tree.config")

-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Auto close if only buffer
local tree_cb = nvim_tree_config.nvim_tree_callback
vim.api.nvim_create_autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd "quit"
		end
	end
})

nvim_tree.setup({
	hijack_cursor = true,
	update_cwd = true,
	respect_buf_cwd = true,

	view = {
		adaptive_size = true,
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
				{ key = "h", cb = tree_cb "close_node" },
				{ key = "u", action = "dir_up" },
				{ key = "v", cb = tree_cb "vsplit" },
			},
		},
	},

	update_focused_file = {
		enable = true,
		update_root = true,
	},

	git = {
		enable = true,
		ignore = false,
		timeout = 500,
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
	};
	default = true; -- globally enable default icons
}


vim.api.nvim_set_keymap("n", "<leader>e", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
