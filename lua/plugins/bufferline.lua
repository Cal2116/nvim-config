return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "famiu/bufdelete.nvim", -- ✨ 用于优雅删除 buffer
    },
    config = function()
      require("bufferline").setup({
        options = {
          mode = "buffers",
          diagnostics = "nvim_lsp",
          separator_style = "slant",
          show_buffer_close_icons = true,
          show_close_icon = false,
          always_show_bufferline = true,
        },
      })

      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }

      -- 🚀 快捷键绑定
      map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
      map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)
      map("n", "<leader>bh", ":BufferLineMovePrev<CR>", opts)
      map("n", "<leader>bl", ":BufferLineMoveNext<CR>", opts)

      -- ✅ 使用 BufDelete 删除 buffer，不破坏窗口布局
      map("n", "<leader>bd", ":Bdelete<CR>", { desc = "Delete buffer gracefully", silent = true })

      -- 🔢 跳转到特定 buffer（1~9）
      for i = 1, 9 do
        map("n", "<leader>" .. i, ":BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Go to buffer " .. i, silent = true })
      end
    end,
  },
}

