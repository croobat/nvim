local autocmd = vim.api.nvim_create_autocmd

-- dont list quickfix buffers
autocmd("FileType", {
	pattern = "qf",
	callback = function()
		vim.opt_local.buflisted = false
	end,
})

-- Set window title
autocmd("BufEnter", {
	callback = function()
		local get_project_dir = function()
			local cwd = vim.fn.getcwd()
			local project_dir = vim.split(cwd, "/")
			local project_name = project_dir[#project_dir]
			return project_name
		end

		vim.opt.titlestring = get_project_dir() .. " - nvim"
	end,
})

-- Keep hardline
autocmd("BufEnter", {
	callback = function()
		local status_ok, hardline = pcall(require, "hardline")
		if not status_ok then
			return
		end
		hardline.setup()
	end
})

-- Auto close nvim-tree if only buffer
autocmd("BufEnter", {
	nested = true,
	callback = function()
		if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
			vim.cmd("quit")
		end
	end,
})

-- Remove numbers and caps from spell-checking
autocmd("BufEnter", {
	callback = function()
		vim.cmd("syn match myExNonWords +\\<\\p*[^A-Za-z \\t]\\p*\\>+ contains=@NoSpell")
		vim.cmd(":syn match myExCapitalWords +\\<[A-Z]\\w*\\>+ contains=@NoSpell")
	end,
})

-- Disable auto-comment new line
autocmd("BufWinEnter", {
	callback = function()
		vim.cmd("checktime")
		vim.cmd("set formatoptions-=cro")
	end,
})

-- Change illuminated word color
autocmd("VimEnter", {
	callback = function()
		vim.cmd("hi link illuminatedWord LspReferenceText")
	end,
})

-- Auto resizing window
autocmd("VimResized", {
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- Change tab size to 2
autocmd("Filetype", {
	pattern = {
		"javascript",
		"vue",
		"json",
		"sh",
		"zsh",
	},
	callback = function()
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
	end,
})

-- Change tabs to spaces
autocmd("Filetype", {
	pattern = {
		"javascript",
		"vue",
		"json",
		"sh",
	},
	callback = function()
		vim.opt_local.expandtab = true
	end,
})

-- Close help pages with q
autocmd("Filetype", {
	pattern = {
		"Jaq",
		"qf",
		"help",
		"man",
		"lspinfo",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"Markdown",
	},
	callback = function()
		vim.cmd([[
		nnoremap <silent> <buffer> q :close<CR> 
		nnoremap <silent> <buffer> <esc> :close<CR> 
		set nobuflisted ]])
	end,
})

-- Enable wrap and spelling
autocmd("Filetype", {
	pattern = { "gitcommit", "markdown", "NeogitCommitMessage" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Disable linenumber on textfiles
autocmd("Filetype", {
	pattern = { "text" },
	callback = function()
		vim.opt_local.number = false
	end,
})

-- Disable foldmethod for diff files
autocmd("Filetype", {
	pattern = { "diff", "gitcommit" },
	callback = function()
		vim.opt_local.number = false
		vim.opt_local.foldmethod = "diff"
		vim.opt.listchars = { tab = "  " }
		-- vim.cmd("IndentBlanklineDisable")
		vim.cmd("hi DiffAdd guifg=#449dab guibg=NONE")
		vim.cmd("hi DiffDelete guifg=#914c54 guibg=NONE")
		vim.cmd("hi DiffChange guifg=#6183bb guibg=NONE")
	end,
})

-- Disable text-width
autocmd("Filetype", {
	pattern = { "csv, sql", "tmux", "crontab" },
	callback = function()
		vim.cmd("setlocal textwidth=0")
	end,
})

-- Auto-close command window
autocmd("CmdWinEnter", {
	callback = function()
		vim.cmd("quit")
	end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "Visual", timeout = 300 })
	end,
})

-- Unlink luasnippet on cursor hold
autocmd("CursorHold", {
	callback = function()
		local status_ok, luasnip = pcall(require, "luasnip")
		if not status_ok then
			return
		end
		if luasnip.expand_or_jumpable() then
			-- ask maintainer for option to make this silent
			-- luasnip.unlink_current()
			vim.cmd([[silent! lua require("luasnip").unlink_current()]])
		end
	end,
})
