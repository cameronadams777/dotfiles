-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Ported from dotfiles/nvim (packer config), mapped onto the plugins LazyVim ships
local map = vim.keymap.set

-- File explorer (was NvimTree)
map("n", "<leader>pv", "<cmd>Neotree toggle<CR>", { desc = "Toggle Explorer" })

-- Move selected lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

-- Keep cursor in place / centered
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Paste over selection without losing the register
map("x", "<leader>p", [["_dP]], { desc = "Paste Without Yank" })

-- System clipboard yank
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to Clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank Line to Clipboard" })

-- Delete to the black hole register
map({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete Without Yank" })

map("i", "<C-c>", "<Esc>")
map("n", "Q", "<nop>")
map("n", "<leader>f", function() LazyVim.format({ force = true }) end, { desc = "Format" })

-- Quickfix / location list
map("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next Quickfix" })
map("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Prev Quickfix" })
map("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next Loclist" })
map("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Prev Loclist" })

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace Word Under Cursor" })
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make File Executable" })
map("n", "<leader><leader>", "<cmd>so<CR>", { desc = "Source File" })

-- Pickers (was telescope)
map("n", "<leader>pf", function() Snacks.picker.files() end, { desc = "Find Files" })
map("n", "<C-p>", function() Snacks.picker.git_files() end, { desc = "Git Files" })
map("n", "<leader>ps", function() Snacks.picker.grep() end, { desc = "Grep" })
map("n", "<leader>vh", function() Snacks.picker.help() end, { desc = "Help Pages" })

-- Undo history (was undotree)
map("n", "<leader>u", function() Snacks.picker.undo() end, { desc = "Undo History" })

-- Zen (was zen-mode)
map("n", "<leader>zz", function() Snacks.zen() end, { desc = "Zen Mode" })
map("n", "<leader>zZ", function() Snacks.zen.zoom() end, { desc = "Zoom" })

-- Trouble
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { silent = true, desc = "Quickfix List (Trouble)" })

-- LSP
map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { desc = "Workspace Symbol" })
map("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "Line Diagnostics" })
map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { desc = "Code Action" })
map("n", "<leader>vrr", function() vim.lsp.buf.references() end, { desc = "References" })
map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { desc = "Rename" })
map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "Signature Help" })
