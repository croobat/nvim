local telescope = require "telescope"
local actions = require "telescope.actions"

telescope.setup {
	path_display = { "truncate" },

	defaults = {
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		},
		file_ignore_patterns = {
			".git/", "target/", "docs/",
			"vendor/*", "%.lock", "__pycache__/*",
			"%.sqlite3", "%.ipynb", "node_modules/*",
			-- "%.jpg", "%.jpeg", "%.png",
			"%.svg", "%.otf", "%.ttf",
			"%.webp", ".dart_tool/", ".github/",
			".gradle/", ".idea/", ".settings/",
			".vscode/", "__pycache__/", "build/",
			"env/", "gradle/", "node_modules/",
			"%.pdb", "%.dll", "%.class",
			"%.exe", "%.cache", "%.ico",
			"%.pdf", "%.dylib", "%.jar",
			"%.docx", "%.met", "smalljre_*/*",
			".vale/", "%.burp", "%.mp4",
			"%.mkv", "%.rar", "%.zip",
			"%.7z", "%.tar", "%.bz2",
			"%.epub", "%.flac", "%.tar.gz",
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		prompt_prefix = "$ ",
		selection_caret = "> ",
	},

	pickers = {
		find_files = {
			hidden = true,
		},
		live_grep = {
			only_sort_text = true,
		},
		grep_string = {
			only_sort_text = true,
		},
		buffers = {
			initial_mode = "normal",
			mappings = {
				i = {
					["<C-d>"] = actions.delete_buffer,
				},
				n = {
					["dd"] = actions.delete_buffer,
				},
			},
		},
		planets = {
			show_pluto = true,
			show_moon = true,
		},
		git_files = {
			hidden = true,
			show_untracked = true,
		},
		colorscheme = {
			enable_preview = true,
		},
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
