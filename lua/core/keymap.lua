-- 将撤销绑定到 Ctrl + Z
vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })

-- 打开 Chat 窗口
vim.keymap.set("n", "<leader>cc", function()
  require("CopilotChat").toggle()
end, { desc = "Toggle Copilot Chat" })

-- 在 visual 模式下对所选代码进行提问
vim.keymap.set("v", "<leader>cq", function()
  require("CopilotChat").ask("解释这段代码")
end, { desc = "Copilot Chat: explain selected code" })

vim.g.copilot_no_tab_map = true

vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("<CR>")', {
  expr = true,
  silent = true,
  noremap = true,
})


