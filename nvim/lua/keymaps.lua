local opts = { noremap = true, silent = true }

-- Shorten function name
local map = vim.keymap.set

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Buffer barbar.nvim
map("n", "<C-S-h>", "<CMD>bp<CR>", opts)
map("n", "<C-S-l>", "<CMD>bn<CR>", opts)
map("n", "<leader>w", "<CMD>q<CR>", opts)

-- Resize with arrows
map("n", "<C-Up>", "<CMD>resize -2<CR>", opts)
map("n", "<C-Down>", "<CMD>resize +2<CR>", opts)
map("n", "<C-Left>", "<CMD>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<CMD>vertical resize +2<CR>", opts)

-- NeooTree
map("n", "<leader>e", "<CMD>Neotree toggle<CR>", opts)
map("n", "<leader>s", "<CMD>Neotree reveal<CR>", opts)

-- Telescope
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts)
map("n", "<leader>fw", "<CMD>Telescope live_grep<CR>", opts)
map("n", "<M-e>", "<CMD>Telescope buffers<CR>", opts)

-- Git
map("n", "<leader>ga", "<CMD>Gitsigns blame_line<CR>", opts)
map("n", "<leader>gd", "<CMD>Gitsigns diffthis<CR>", opts)
map("n", "<leader>gr", "<CMD>Gitsigns reset_hunk<CR>", opts)
map("n", "]g", "<CMD>Gitsigns next_hunk<CR>", opts)
map("n", "[g", "<CMD>Gitsigns prev_hunk<CR>", opts)

-- Lsp
map("n", "<leader>ma", "<CMD>Mason<CR>", opts)
map("n", "<leader>n", "<CMD>ASToggle<CR>", opts) -- auto save toggle
map("n", "==", "<CMD>lua require('conform').format()<CR>", opts)

--
map("n", "<esc><esc>", "<CMD>noh<CR>", opts)
map("i", "<C-a>", "<Home>", opts)
map("i", "<C-e>", "<End>", opts)
map("n", "yY", "^y$", opts)

map("n", "cx", "<CMD>lua require('substitute.exchange').operator()<CR>", opts)
map("n", "cxx", "<CMD>lua require('substitute.exchange').line()<CR>", opts)
map("v", "cx", "<CMD>lua require('substitute.exchange').visual()<CR>", opts)

map("n", "gr", "<CMD>lua require('substitute').operator()<CR>", opts)
map("n", "grr", "<CMD>lua require('substitute').line()<CR>", opts)
map("x", "gr", "<CMD>lua require('substitute').visual()<CR>", opts)
