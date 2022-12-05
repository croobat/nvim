local toggleterm = require("toggleterm")

toggleterm.setup({
    size = 30,
    open_mapping = [[<c-\>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
        border = "curved",
        winblend = 0,
        highlights = {
            border = "Normal",
            background = "Normal",
        },
    },
})

function _G.set_terminal_keymaps()
    -- local opts = {noremap = true}
    -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
    -- vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

local liveserver = Terminal:new({ cmd = "live-server --browser=firefox-developer-edition", hidden = true })
function _LIVESERVER_TOGGLE()
    liveserver:toggle()
end
