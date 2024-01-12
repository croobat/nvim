-- use markdown
vim.g.vimwiki_list = {
  {
	path = "~/Documents/vimwiki/",
	syntax = "markdown",
	ext = ".md",
  },
}

-- disable global markdown (only g:vimwiki_list files count as vimwiki type)
vim.g.vimwiki_global_ext = 0

-- disable default mappings
vim.g.vimwiki_key_mappings = { global = 0 }

-- colors
vim.cmd("hi VimwikiHeader2 guifg=#ffb86c gui=bold")
vim.cmd("hi VimwikiHeader3 guifg=#ff79c6 gui=bold")
vim.cmd("hi VimwikiHeader4 guifg=#50fa7b gui=bold")
vim.cmd("hi VimwikiHeader5 guifg=#f1fa8c gui=italic")
vim.cmd("hi VimwikiHeader6 guifg=#f1fa8c")
vim.cmd("hi VimwikiLink    guifg=#8BE9FD gui=italic")
