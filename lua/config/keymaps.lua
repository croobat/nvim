--[[
Keymaps are automatically loaded on the VeryLazy event

Default keymaps that are always set:
https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
Add any additional keymaps here (redundant with lazyvim are commented out)

comment config mappings file to avoid overrides:
~/.local/share/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua
--]]
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local map = vim.keymap.set
local unmap = vim.keymap.del

-- better yanking (use yanky plugin)
map({"n","x"}, "p", "<Plug>(YankyPutAfter)")
map({"n","x"}, "P", "<Plug>(YankyPutBefore)")
map({"n","x"}, "gp", "<Plug>(YankyGPutAfter)")
map({"n","x"}, "gP", "<Plug>(YankyGPutBefore)")
map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
map("n", "<c-n>", "<Plug>(YankyNextEntry)")

-- better movement
map({ "n", "v", "x" }, "<C-j>", "5gj", opts)
map({ "n", "v", "x" }, "<C-k>", "5gk", opts)
map({ "n", "v", "x" }, "<C-h>", "5h", opts)
map({ "n", "v", "x" }, "<C-l>", "5l", opts)

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
map("n", "<A-k>", "<cmd>m .-2<cr>==", opts)
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", opts)
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", opts)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- ## Normal ##
-- center screen when jumping to next
map("n", "n", "nzz", opts)
map("n", "N", "Nzz", opts)

-- better window navigation
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

-- resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- navigate buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- folding
map("n", ",", "za", opts)

-- insert line
map("n", "<enter>", "o<esc>", opts)
map("n", "<A-enter>", "i<CR><esc>", opts)

-- word wrap
map("n", "<A-z>", ":set wrap!<CR>", opts)

--quickfix
map("n", "<C-n>", ":cnext<CR>", opts)
map("n", "<C-p>", ":cprevious<CR>", opts)
map("n", "<C-q>", ":copen<CR>", opts)
map("n", "<C-A-q>", ":cclose<CR>", opts)

-- yank inner word
-- map("n", "yw", "yiw", opts)

--## Insert ##
-- emacs like keys
map("i", "<C-a>", "<ESC>I", opts)
map("i", "<C-e>", "<ESC>A", opts)
map("i", "<M-f>", "<ESC>lWi", opts)
map("i", "<M-b>", "<ESC>Bi", opts)
map("i", "<M-d>", "<ESC>ciw", opts)

--## Visual ##
-- stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- move text up and down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)

-- delete without yanking (leader + d)
map("v", "<leader>d", '"_d', opts)

--## Visual Block ##
-- move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--## Terminal ##
-- better terminal navigation
map("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
