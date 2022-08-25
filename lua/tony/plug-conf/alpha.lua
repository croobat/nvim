local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                                    __                  ]],
	[[   ___      ___     ___    __  __  /\_\     ___ ___     ]],
	[[  / _ `\   / __`\  / __`\ /\ \/\ \ \/\ \   / __` __`\   ]],
	[[ /\ \/\ \ /\  __/ /\ \_\ \\ \ \_/ | \ \ \ /\ \/\ \/\ \  ]],
	[[ \ \_\ \_\\ \____\\ \____/ \ \___/   \ \_\\ \_\ \_\ \_\ ]],
	[[  \/_/\/_/ \/____//\/___/   \/__/     \/_/ \/_/\/_/\/_/ ]],
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("i", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
-- NOTE: requires the fortune-mod package to work
  local motivate_rep
  repeat
    local handle = io.popen("motivate 0 0 0 0 0 0")

    local function wrap(text, width)
      local tail, lines = text.." ", {}
      while tail do
        lines[#lines + 1], tail = tail
          :gsub("^%s+", "")
           -- .[\128-191]* for utf texts, . for 1-byte encoding
          :gsub(".[\128-191]*", "\0%0\0", width)          :gsub("%z%z", "")
          :gsub("(%S)%z(%s)", "%1%2\0")
          :gsub("^(%z[^\r\n%z]*)%f[%s](%Z*)%z(.*)$", "%1\0%2%3")
          :match"^%z(%Z+)%z(.*)$"
      end
      return table.concat(lines, "\n")
    end

    local motivate = handle:read("*a")
    handle:close()
    motivate_rep = motivate:gsub( "%[0m", "" )
    motivate_rep = motivate_rep:gsub( "%[0;30;40m", "" )
    motivate_rep = wrap(motivate_rep, 80)
  until(string.len(motivate_rep) < 170)
	return motivate_rep
	-- return "chrisatmachine.com"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)

