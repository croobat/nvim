require "core.options"
require "core.keymaps"
require "core.autocommands"

-- Check if loaded without plugins 'noplugin'
local noplugin = false
for _, arg in ipairs(vim.v.argv) do
	if arg == '--noplugin' then
		noplugin = true
		break
	end
end

if not noplugin then
	pcall(require, "impatient")

	-- require vimwiki constants before plugins
	require "plugins.vimwiki"

	require "plugins"
	require "lsp"
else
	-- if no plugins only load colorscheme
	vim.cmd("colorscheme tokyonight-night")
end
