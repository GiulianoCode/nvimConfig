-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For conciseness
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- Disable the spacebar key's default behavior in Normal and Visual modes
keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Clear highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear Search Highlights", noremap = true, silent = true })

-- Save File
keymap.set("n", "<C-s>", "<cmd> w <CR>", { desc = "Save File", noremap = true, silent = true })

-- Save File Without auto-formatting
keymap.set("n", "<leader>sn","<cmd>noautocmd w <CR>", { desc = "Save File (No auto-formatting)", noremap = true, silent = true })

-- Quit File
keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
keymap.set("n", "x", '"_x', opts)

-- Mapea 'd' para usar el registro negro por defecto
keymap.set("n", "d", '"_d', opts)
keymap.set("n", "dd", '"_dd', opts)
keymap.set("v", "d", '"_d', opts)

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
keymap.set("n", "<leader>bx", ":bdelete!<CR>", { desc = "Close Buffer", noremap = true, silent = true }) -- close buffer
keymap.set("n", "<leader>b", "<cmd> enew <CR>", { desc = "New Buffer", noremap = true, silent = true }) -- new buffer

-- Window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split Window (V)", noremap = true, silent = true }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split Window (H)", noremap = true, silent = true }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Split Window Default Size", noremap = true, silent = true }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close Current Split Window", noremap = true, silent = true }) -- close current split window

-- Navigate between splits
keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open New Tab", noremap = true, silent = true }) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close Current Tab", noremap = true, silent = true }) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go To Next Tab", noremap = true, silent = true }) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go To Previous Tab", noremap = true, silent = true }) --  go to previous tab

-- Toggle line wrapping
keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", { desc = "Toggle Line Wrapping", noremap = true, silent = true })

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
