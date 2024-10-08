return {
  "vimwiki/vimwiki",
  requires = {
    "tpope/vim-markdown",
  },
  init = function()
    vim.g.vimwiki_global_ext = 0

    vim.g.vimwiki_list = {
      {
        path = "~/Documents/vimwiki",
        syntax = "markdown",
        ext = ".md",
      },
    }

    vim.g.vimwiki_key_mappings = { global = 0 }

    vim.cmd("hi VimwikiHeader2 guifg=#ffb86c gui=bold")
    vim.cmd("hi VimwikiHeader3 guifg=#ff79c6 gui=bold")
    vim.cmd("hi VimwikiHeader4 guifg=#50fa7b gui=bold")
    vim.cmd("hi VimwikiHeader5 guifg=#f1fa8c gui=italic")
    vim.cmd("hi VimwikiHeader6 guifg=#f1fa8c")
    vim.cmd("hi VimwikiLink    guifg=#8BE9FD gui=italic")
  end,
}
