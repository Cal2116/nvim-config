-- 将撤销绑定到 Ctrl + Z
vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })

-- 复制当前行到系统剪贴板
vim.api.nvim_set_keymap("n", "<leader>cy", '"+yy', { noremap = true, silent = true, desc = "Copy current line to clipboard" })
-- (Visual 模式)复制选中区域到系统剪贴板
vim.api.nvim_set_keymap("v", "<leader>cy", '"+y', { noremap = true, silent = true, desc = "Copy selected content to clipboard" })
-- 复制当前单词到系统剪贴板
vim.api.nvim_set_keymap("n", "<leader>cyw", '"+yw', { noremap = true, silent = true, desc = "Copy word under cursor to clipboard" })

-- 删除当前行并将其放入剪贴板
vim.api.nvim_set_keymap("n", "<leader>cd", '"+dd', { noremap = true, silent = true, desc = "Cut current line to clipboard" })
-- (Visual 模式)删除选中区域并将其放入剪贴板
vim.api.nvim_set_keymap("v", "<leader>cd", '"+d', { noremap = true, silent = true, desc = "Cut selected content to clipboard" })

-- 从剪贴板粘贴内容到光标后
vim.api.nvim_set_keymap("n", "<leader>cp", '"+p', { noremap = true, silent = true, desc = "Paste clipboard content after cursor" })
