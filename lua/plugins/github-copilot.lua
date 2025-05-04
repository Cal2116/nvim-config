return {
  {
    "github/copilot.vim", -- 必须先安装原始 Copilot 插件
    event = "InsertEnter",
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main", -- canary 分支支持 Chat 功能
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat").setup({
        window = {
          layout = "float", -- 浮动窗口
          width = 0.8,
          height = 0.7,
        },
        mappings = {
          close = { "<Esc>" }, -- 关闭对话框
          submit_prompt = "<CR>", -- 提交提问
        },
      })
    end,
  },
}


