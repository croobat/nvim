-- Setup{{{
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	print 'error'
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true,  -- misc bindings to work with windows
			z = true,    -- bindings for folds, spelling and others prefixed with z
			g = true,    -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = ">>", -- symbol used in the command line area that shows your active key combo
		separator = "->", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },                                        -- min and max height of the columns
		width = { min = 20, max = 50 },                                        -- min and max width of the columns
		spacing = 3,                                                           -- spacing between columns
		align = "left",                                                        -- align columns left, center or right
	},
	ignore_missing = true,                                                     -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true,                                                          -- show help message on the command line when the popup is visible
	triggers = "auto",                                                         -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	-- Leader keys
	mode = "n",  -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}                --}}}

local mappings = {
	[","] = { "A,<esc>", "Insert comma" },
	["."] = { "A.<esc>", "Insert dot" },
	[";"] = { "A;<esc>", "Insert semicolon" },
	["="] = { "A = ", "Insert equal" },
	["/"] = { "<cmd>Telescope live_grep<cr>", "Find text" },
	["?"] = { "<cmd>Telescope find_files<cr>", "Find Files" },
	["<leader>"] = { "i <esc>l", "Insert space" },
	-- D = debug
	-- L = latex
	-- P = python
	["Q"] = { "<cmd>:Bdeleteexcept<cr><cmd>NvimTreeToggle<cr><cmd>NvimTreeToggle<cr>", "Close Other Buffers" },
	-- a = auto-options
	-- c = comment box
	["d"] = { '"_d', "Delete withouth yanking" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["f"] = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "LSP format" },
	["F"] = { "<cmd>%s/\\s\\+$//e<cr>", "Trailing spaces" },
	-- g = git
	-- l = lsp
	["p"] = { "<cmd>Prettier<cr>", "Prettier" },
	["q"] = { "<cmd>:TSDisable rainbow<cr><cmd>Bdelete<cr><cmd>:TSEnable rainbow<cr>", "Close Buffer" },
	-- t = telescope
	["w"] = { "<cmd>w!<cr>", "Save" },
	["W"] = { "<cmd>SudaWrite<cr>", "Save (sudo)" },
	["x"] = { "I* [ ] <esc>", "Insert checkbox" },
	["z"] = { "<cmd>:ZenMode<cr>", "Zen mode" },
	D = {
		name = "Debug",
		b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
		c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
		C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run To Cursor" },
		d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
		g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
		i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
		o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
		p = { "<cmd>lua require'dap'.pause()<cr>", "Pause" },
		q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
		r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
		s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
		t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
		u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		U = { "<cmd>lua require'dapui'.toggle({reset = true})<cr>", "Toggle UI" },
	},
	L = {
		name = "LaTeX",
		m = { "<cmd>VimtexContextMenu<cr>", "Open Context Menu" },
		u = { "<cmd>VimtexCountLetters<cr>", "Count Letters" },
		w = { "<cmd>VimtexCountWords<cr>", "Count Words" },
		d = { "<cmd>VimtexDocPackage<cr>", "Open Doc for package" },
		e = { "<cmd>VimtexErrors<cr>", "Look at the errors" },
		s = { "<cmd>VimtexStatus<cr>", "Look at the status" },
		a = { "<cmd>VimtexToggleMain<cr>", "Toggle Main" },
		v = { "<cmd>VimtexView<cr>", "View pdf" },
		i = { "<cmd>VimtexInfo<cr>", "Vimtex Info" },
		l = {
			name = "Clean",
			l = { "<cmd>VimtexClean<cr>", "Clean Project" },
			c = { "<cmd>VimtexClean<cr>", "Clean Cache" },
		},
		c = {
			name = "Compile",
			c = { "<cmd>VimtexCompile<cr>", "Compile Project" },
			o = {
				"<cmd>VimtexCompileOutput<cr>",
				"Compile Project and Show Output",
			},
			s = { "<cmd>VimtexCompileSS<cr>", "Compile project super fast" },
			e = { "<cmd>VimtexCompileSelected<cr>", "Compile Selected" },
		},
		r = {
			name = "Reload",
			r = { "<cmd>VimtexReload<cr>", "Reload" },
			s = { "<cmd>VimtexReloadState<cr>", "Reload State" },
		},
		o = {
			name = "Stop",
			p = { "<cmd>VimtexStop<cr>", "Stop" },
			a = { "<cmd>VimtexStopAll<cr>", "Stop All" },
		},
		t = {
			name = "TOC",
			o = { "<cmd>VimtexTocOpen<cr>", "Open TOC" },
			t = { "<cmd>VimtexTocToggle<cr>", "Toggle TOC" },
		},
	},
	P = {
		name = "Python",
		i = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env" },
		v = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Show Env" },
		d = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" },
		c = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" },
		m = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" },
		-- Jupyter
		D = { "<Cmd>MagmaDelete<cr>", "Delete cell" },
		E = { "<esc><cmd>MagmaEvaluateVisual<cr>", "Evaluate Highlighted Line" },
		I = { "<Cmd>MagmaInit<cr>", "Init Magma" },
		R = { "<Cmd>MagmaRestart!<cr>", "Restart Magma" },
		S = { "<Cmd>MagmaSave<cr>", "Save" },
		e = { "<Cmd>MagmaEvaluateLine<cr>", "Evaluate Line" },
		k = { "<Cmd>MagmaDeinit<cr>", "Deinit Magma" },
		r = { "<Cmd>MagmaReevaluateCell<cr>", "Re evaluate cell" },
		s = { "<Cmd>MagmaShowOutput<cr>", "Show Output" },
	},
	a = {
		name = "Auto-options",
		C = { "<cmd>setlocal formatoptions-=cro<cr>", "Auto-comment off" },
		F = { "<cmd>set foldmethod=marker<cr>", "Fold mark" },
		H = { "<cmd>nohlsearch<cr>", "Highlight off" },
		I = { "<cmd>setlocal noautoindent<cr>", "Auto-indent off" },
		L = { "<cmd>set colorcolumn=0<cr>", "Color column off" },
		T = { "<cmd>set shiftwidth=4 tabstop=4<cr>", "Indent 4 spaces" },
		c = { "<cmd>setlocal formatoptions+=cro<cr>", "Auto-comment on" },
		f = { "<cmd>set foldmethod=indent<cr>", "Fold indent" },
		h = { "<cmd>lua vim.opt.hlsearch = true<cr>", "Highlight on" },
		i = { "<cmd>setlocal autoindent<cr>", "Auto-indent on" },
		l = { "<cmd>set colorcolumn=79<cr>", "Color column on" },
		s = { "<cmd>%s/\\s\\+$//e<cr>", "Remove traling spaces" },
		t = { "<cmd>set shiftwidth=2 tabstop=2<cr>", "Indent 2 spaces" },
		x = { "<cmd>ColorizerToggle<cr>", "Hex colors toggle" },
	},
	c = {
		name = "Comment Box",
		TL = { "<cmd>lua require('comment-box').cline(3)<cr>", "heavy line" },
		TT = { "<cmd>lua require('comment-box').accbox(3)<cr>", "Title Heavy" },
		a = { "<cmd>lua require('comment-box').albox(10)<cr>", "Classic ASCII" },
		l = { "<cmd>lua require('comment-box').cline(10)<cr>", "ASCII line" },
		c = { "<cmd>lua require('comment-box').albox(2)<cr>", "Classic" },
		g = { "<cmd>lua require('comment-box').catalog()<cr>", "Box Catalog" },
		h = { "<cmd>lua require('comment-box').albox(3)<cr>", "Heavy" },
		L = { "<cmd>lua require('comment-box').cline(1)<cr>", "Simple line" },
		t = { "<cmd>lua require('comment-box').accbox(7)<cr>", "Title" },
	},
	g = {
		name = "Git",
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		b = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame" },
		B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk" },
	},
	l = {
		name = "LSP",
		R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		-- S = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>lua vim.diagnostic.config({signs=true})<cr>", "Enable signs" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "CodeLens Action" },
		c = { "<cmd>lua require('Comment').setup { pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook() }<cr>", "Jsx comments" },
		d = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "List definitions" },
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "List implementations" },
		j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
		k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Run" },
		q = { "<cmd>lua vim.diagnostic.setloclist<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
		-- s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature help" },
		s = { "<cmd>lua vim.diagnostic.config({signs=false})<cr>", "Disable signs" },
		u = {
			"<cmd>lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with( vim.lsp.diagnostic.on_publish_diagnostics, {underline = true})<cr>",
			"enable underline",
		},
		U = {
			"<cmd>lua vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with( vim.lsp.diagnostic.on_publish_diagnostics, {underline = false})<cr>",
			"disable underline",
		},
	},
	r = {
		name = "Rust",
		r = { "<cmd>RustRunnables<cr>", "Runnables" },
		t = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test" },
		m = { "<cmd>RustExpandMacro<cr>", "Expand Macro" },
		c = { "<cmd>RustOpenCargo<cr>", "Open Cargo" },
		p = { "<cmd>RustParentModule<cr>", "Parent Module" },
		d = { "<cmd>RustDebuggables<cr>", "Debuggables" },
		v = { "<cmd>RustViewCrateGraph<cr>", "View Crate Graph" },
		R = {
			"<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<cr>",
			"Reload Workspace",
		},
		o = { "<cmd>RustOpenExternalDocs<cr>", "Open External Docs" },
		y = { "<cmd>lua require'crates'.open_repository()<cr>", "[crates] open repository" },
		P = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup" },
		i = { "<cmd>lua require'crates'.show_crate_popup()<cr>", "[crates] show info" },
		f = { "<cmd>lua require'crates'.show_features_popup()<cr>", "[crates] show features" },
		D = { "<cmd>lua require'crates'.show_dependencies_popup()<cr>", "[crates] show dependencies" },
		x = { "<cmd>RustOpenExternalDocs<cr>", "External docs" },
	},
	t = {
		name = "Telescope",
		C = { "<cmd>Telescope git_bcommits<cr>", "Git commits current buffer" },
		D = { "<cmd>Telescope diagnostics<cr>", "Document Diagnostics" },
		H = { "<cmd>Telescope help_tags<cr>", "Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		T = { "<cmd>TodoTelescope<cr>", "TODOs" },
		b = { "<cmd>Telescope git_branches<cr>", "Git branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Git commit" },
		d = { "<cmd>Telescope lsp_definition<cr>", "LSP definition" },
		f = { "<cmd>Telescope find_files<cr>", "Files" },
		g = { "<cmd>Telescope tags<cr>", "Tags" },
		h = { "<cmd>Telescope oldfiles<cr>", "History files" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		m = { "<cmd>Telescope marks<cr>", "Mark" },
		p = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
		q = { "<cmd>Telescope quickfix<cr>", "LSP quickfix" },
		r = { "<cmd>Telescope lsp_references<cr>", "LSP reference" },
		t = { "<cmd>Telescope resume<cr>", "Resume search" },
		["="] = { "<cmd>Tabularize /=<cr>", "Tabularize =" },
		["-"] = { "<cmd>Tabularize /--<cr>", "Tabularize --" },
		[":"] = { "<cmd>Tabularize /:<cr>", "Tabularize :" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
