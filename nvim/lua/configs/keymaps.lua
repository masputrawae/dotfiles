-- ~/.config/nvim/lua/keymap.lua
local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<cr>",       { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<cr>",       { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<cr>",     { desc = "Force quit all" })

map("n", "<C-h>", "<C-w>h", { silent = true, desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { silent = true, desc = "Go to lower window" })
map("n", "<C-k>", "<C-w>k", { silent = true, desc = "Go to upper window" })
map("n", "<C-l>", "<C-w>l", { silent = true, desc = "Go to right window" })

map("n", "<C-Up>",    "<cmd>resize +2<cr>",         { desc = "Increase window height" })
map("n", "<C-Down>",  "<cmd>resize -2<cr>",         { desc = "Decrease window height" })
map("n", "<C-Left>",  "<cmd>vertical resize -2<cr>",{ desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>",{ desc = "Increase window width" })

map("n", "<Tab>",     "<cmd>bnext<cr>",     { desc = "Next buffer" })
map("n", "<S-Tab>",   "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>x","<cmd>bdelete<cr>",    { desc = "Close buffer" })
map("n", "<leader>X", "<cmd>bp|bd #<cr>",   { desc = "Close buffer and keep window" })

map("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page (centered)" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page (centered)" })

map("v", "<", "<gv", { desc = "De-indent and keep selection" })
map("v", ">", ">gv", { desc = "Indent and keep selection" })

map("n", "<A-j>", "<cmd>m .+1<cr>==",  { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==",  { desc = "Move line up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv",  { desc = "Move selected lines down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv",  { desc = "Move selected lines up" })

map("v", "p", '"_dP', { desc = "Paste without replacing register" })

map("i", "jk", "<Esc>", { desc = "Escape from insert mode" })
map("i", "kj", "<Esc>", { desc = "Escape from insert mode" })
map("n", "<leader>sv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })
map("n", "<leader>sh", "<cmd>split<cr>",  { desc = "Split window horizontally" })
map("n", "<leader>rn", "<cmd>set rnu!<cr>", { desc = "Toggle relative line numbers" })

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags" })
