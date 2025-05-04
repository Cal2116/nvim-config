-- 将撤销绑定到 Ctrl + Z
vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })
