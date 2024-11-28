vim.cmd([[
	hi GitSignsAdd guifg=#266d6a guibg=NONE gui=NONE
	hi GitSignsAddNr guifg=#266d6a guibg=NONE gui=NONE
	hi GitSignsAddLn guifg=#266d6a guibg=NONE gui=NONE
]])

vim.cmd([[
	hi GitSignsChange guifg=#536c9e guibg=NONE gui=NONE
	hi GitSignsChangeNr guifg=#536c9e guibg=NONE gui=NONE
	hi GitSignsChangeLn guifg=#536c9e guibg=NONE gui=NONE
]])

vim.cmd([[
	hi GitSignsDelete guifg=#b2555b guibg=NONE gui=NONE
	hi GitSignsDeleteNr guifg=#b2555b guibg=NONE gui=NONE
	hi GitSignsDeleteLn guifg=#b2555b guibg=NONE gui=NONE
]])

vim.cmd([[
	hi GitSignsChangeDelete guifg=#536c9e guibg=NONE gui=NONE
	hi GitSignsChangeDeleteNr guifg=#536c9e guibg=NONE gui=NONE
	hi GitSignsChangeDeleteLn guifg=#536c9e guibg=NONE gui=NONE
]])

vim.cmd([[
	hi GitSignsTopDelete guifg=#b2555b guibg=NONE gui=NONE
	hi GitSignsTopDeleteNr guifg=#b2555b guibg=NONE gui=NONE
	hi GitSignsTopDeleteLn guifg=#b2555b guibg=NONE gui=NONE
]])

return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = "█" },
        change = { text = "█" },
        delete = { text = "█" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
			signs_staged_enable = false,
      signcolumn = true,
      numhl = false,
      linehl = false,
      word_diff = false,
      current_line_blame = false,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 100,
        ignore_whitespace = false,
      },
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      sign_priority = 100,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = {
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
    },
  },
}
