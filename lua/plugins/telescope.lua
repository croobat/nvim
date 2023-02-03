local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup {
	path_display = { "truncate" },

	defaults = {
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
	-- Default configuration for builtin pickers goes here:
	-- picker_name = {
	--   picker_config_key = value,
	--   ...
	-- }
	-- Now the picker_config_key will be applied every time you call this
	-- builtin picker
	},
	extensions = {
	-- Your extension configuration goes here:
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		}
	}
}

--telescope.load_extension('media_files')
telescope.load_extension('fzf')

vim.api.nvim_set_keymap("n", "<leader>/", ":Telescope live_grep<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>?", ":Telescope find_files<cr>", { noremap = true, silent = true })
