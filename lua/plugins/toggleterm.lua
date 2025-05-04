return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<c-\>]],
      direction = "float",
      float_opts = {
        border = "curved",
        winblend = 3,
      },
      shell = vim.o.shell,
    })

    -- 👇 自定义 lazygit 终端
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      hidden = true,
      direction = "float",
      float_opts = {
        border = "double",
      },
      on_open = function(term)
        vim.cmd("startinsert!")
      end,
    })

    -- 🔥 快捷键：打开 lazygit
    vim.keymap.set("n", "<leader>gg", function()
      lazygit:toggle()
    end, { desc = "Open LazyGit" })
  end,
}

