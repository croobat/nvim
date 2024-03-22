-- Setup {{{
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	print 'error loading which-key'
	return
end

local setup = {
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
	popup_mappings = {
		scroll_down = "<c-j>",
		scroll_up = "<c-k>",
	},
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 2,
		align = "left",
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<cr>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}
--}}}

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
	-- f = format
	-- g = git
	-- l = lsp
	["p"] = { "<cmd>Prettier<cr>", "Prettier" },
	["q"] = { "<cmd>:TSDisable rainbow<cr><cmd>Bdelete<cr><cmd>:TSEnable rainbow<cr>", "Close Buffer" },
	-- s = search and replace word under cursor (autocommands.lua)
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
		TL = { "<cmd>CBline1<cr>", "heavy line" },
		TT = { "<cmd>CBacbox3<cr>", "Title Heavy" },
		a = { "<cmd>CBalbox10<cr>", "Classic ASCII" },
		l = { "<cmd>CBline10<cr>", "ASCII line" },
		c = { "<cmd>CBalbox2<cr>", "Classic" },
		g = { "<cmd>CBcatalob<cr>", "Box Catalog" },
		h = { "<cmd>CBalbox3<cr>", "Heavy" },
		L = { "<cmd>CBline1<cr>", "Simple line" },
		t = { "<cmd>CBacbox7<cr>", "Title" },
	},
	f = {
		name = "Format",
		e = { "<cmd>EslintFixAll<cr>", "eslint format" },
		f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "LSP format" },
		p = { "<cmd>Prettier<cr>", "Prettier format" },
		s = { "<cmd>%s/\\s\\+$//e<cr>", "Trailing spaces" },
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
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
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
		R = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
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
		q = { "<cmd>Telescope quickfix<cr>", "LSP quickfix" },
		r = { "<cmd>Telescope lsp_references<cr>", "LSP reference" },
		t = { "<cmd>Telescope resume<cr>", "Resume search" },
		["="] = { "<cmd>Tabularize /=<cr>", "Tabularize =" },
		["-"] = { "<cmd>Tabularize /--<cr>", "Tabularize --" },
		[":"] = { "<cmd>Tabularize /:<cr>", "Tabularize :" },
		["/"] = { "<cmd>Telescope grep_string<cr>", "Cursor text" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
