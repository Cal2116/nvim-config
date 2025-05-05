return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "main",
  dependencies = {
    "zbirenbaum/copilot.lua",
    "nvim-lua/plenary.nvim",
  },
  cmd = { "CopilotChat", "CopilotChatToggle" },
  keys = {
    { "<leader>cc", "<cmd>CopilotChatToggle<CR>", desc = "打开对话框" },
    { "<leader>ce", "<cmd>CopilotChatExplain<CR>", mode = "v", desc = "解释选中的代码" },
    { "<leader>cf", "<cmd>CopilotChatFix<CR>", mode = "v", desc = "修复选中的代码" },
    { "<leader>co", "<cmd>CopilotChatOptimize<CR>", mode = "v", desc = "优化选中的代码" },
  },
  opts = {
    question_header = "## User ",
    answer_header = "## Copilot ",
    error_header = "## Error ",
    mappings = {
      -- Use tab for completion
      complete = {
        detail = "Use @<Tab> or /<Tab> for options.",
        insert = "<Tab>",
      },
      -- Close the chat
      close = {
        normal = "q",
        insert = "<C-c>",
      },
      -- Reset the chat buffer
      reset = {
        normal = "<C-x>",
        insert = "<C-x>",
      },
      -- Submit the prompt to Copilot
      submit_prompt = {
        normal = "<CR>",
        insert = "<C-CR>",
      },
    },
  },
}

