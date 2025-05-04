return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.6",
  dependencies = {
    { "nvim-lua/plenary.nvim" }, -- Telescope 必需依赖
    { "BurntSushi/ripgrep" },    -- 用于 live_grep（需安装 rg 命令）
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make", enabled = vim.fn.executable("make") == 1 },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        winblend = 10,
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    })

    -- 启用 FZF 加速器（如果已安装）
    pcall(telescope.load_extension, "fzf")

    -- 快捷键绑定
    vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "🔍 Find files" })
    vim.keymap.set("n", "<leader>g", builtin.live_grep, { desc = "🔍 Grep (live)" })
    vim.keymap.set("n", "<leader>b", builtin.buffers,    { desc = "📄 Open buffers" })
    vim.keymap.set("n", "<leader>h", builtin.help_tags,  { desc = "❓ Help tags" })
    vim.keymap.set("n", "<leader>r", builtin.resume,     { desc = "⏪ Resume search" })
  end,
}

