--[[
Autocmds are automatically loaded on the VeryLazy event
Default autocmds that are always set:
https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
Add any additional autocmds here (redundant with lazyvim are commented out)
]]
--
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

-- Auto close neo-tree if only buffer
autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NeoTree_") ~= nil then
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

-- Change tabs to spaces
autocmd("Filetype", {
  pattern = {
    "vue",
    "json",
    "sh",
  },
  callback = function()
    vim.opt_local.expandtab = true
  end,
})


autocmd("Filetype", {
  pattern = {
    "astro",
  },
  callback = function()
    vim.opt_local.expandtab = true
		-- vim.opt_local.tabstop = 4
		-- vim.opt_local.shiftwidth = 4
	end,
})


-- Filetype sh for zsh
autocmd("Filetype", {
  pattern = "zsh",
  callback = function()
    vim.bo.filetype = "sh"
  end,
})

-- 100 text width
autocmd("Filetype", {
  pattern = {
    "vimwiki",
    "markdown",
  },
  callback = function()
    vim.opt_local.textwidth = 100
  end,
})

-- 0 text width
autocmd("Filetype", {
  pattern = { "csv, sql", "tmux", "crontab", "html" },
  callback = function()
    vim.opt_local.textwidth = 0
  end,
})

-- 70 color column
autocmd("Filetype", {
  pattern = { "gitcommit" },
  callback = function()
    vim.opt_local.colorcolumn = "70"
  end,
})

-- 120 color column
autocmd("Filetype", {
  pattern = {
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "json",
    "javascriptreact",
    "typescriptreact",
    "lua",
  },
  callback = function()
    vim.opt_local.colorcolumn = "120"
  end,
})

-- 100, 120 color column
autocmd("Filetype", {
  pattern = { "vue" },
  callback = function()
    vim.opt_local.colorcolumn = "100,120"
  end,
})

-- Close help pages with q
autocmd("FileType", {
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "dbout",
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
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Enable wrap and spelling
autocmd("Filetype", {
  pattern = { "gitcommit", "markdown", "NeogitCommitMessage", "*.txt", "*.tex", "*.typ" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
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

-- Auto-close command window
autocmd("CmdWinEnter", {
  callback = function()
    vim.cmd("quit")
  end,
})

-- Highlight yanked text
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "Visual", timeout = 500 })
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

-- Auto Tabularize bookmarks file
autocmd("BufWritePre", {
  pattern = "/home/tony/.bmks/*",
  callback = function()
    vim.cmd([[silent! Tabularize / - ]])
  end,
})

-- Auto export png when saving mermaid
autocmd("BufWritePost", {
  pattern = "*.mmd",
  callback = function()
    vim.cmd([[silent! !mmdc -i % -o %:r.png --theme forest -s 2]])
  end,
})
