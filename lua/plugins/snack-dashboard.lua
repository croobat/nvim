return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      sections = {
        gap = 1,
        {
          section = "terminal",
          cmd = "pokemon-colorscripts -n crobat --no-title | sed 's/^/             /'; sleep .1",
          random = 10,
          height = 16,
        },
        {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "i", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "/", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
          { icon = " ", key = "l", desc = "Lazy", action = ":lua require('lazy').show()" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        {
          section = "terminal",
          cmd = "echo 'Neovim' | figlet -f slant | lolcat | sed 's/^/           /'; sleep .1",
          random = 10,
          height = 5,
        },
      },
    },
  },
}
