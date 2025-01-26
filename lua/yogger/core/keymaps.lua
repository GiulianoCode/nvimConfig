-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For conciseness
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- save file
keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
keymap.set("n", "<C-d>", "<C-d>zz", opts)
keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
keymap.set("n", "n", "nzzzv", opts)
keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
keymap.set("n", "<Up>", ":resize -2<CR>", opts)
keymap.set("n", "<Down>", ":resize +2<CR>", opts)
keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
keymap.set("n", "<Tab>", ":bnext<CR>", opts)
keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap.set("n", "<leader>bx", ":bdelete!<CR>", opts) -- close buffer
keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-- Navigate between splits
keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
