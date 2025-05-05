-- plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- 图标支持
  },
  config = function()
    local nvim_tree = require("nvim-tree")
    local api = require("nvim-tree.api")

    nvim_tree.setup({
      sort_by = "case_sensitive",
      view = {
        width = 35,
        side = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "name",
        indent_markers = {
          enable = true,
        },
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      git = {
        enable = true,
        ignore = false,
      },
    })

    -- 快捷键绑定
    vim.keymap.set("n", "<leader>nt", ":wincmd h<CR>", { desc = "切换到左侧树" })
    vim.keymap.set("n", "<leader>bt", ":wincmd l<CR>", { desc = "切换到右侧 buffer" })
    vim.keymap.set("n", "<leader>te", ":NvimTreeToggle<CR>", { desc = "打开nvim-tree", silent = true })
    vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", { desc = "在nvim-tree中找到当前文件", silent = true })
    vim.keymap.set("n", "<leader>tc", function()
      api.tree.collapse_all()
    end, { desc = "折叠所有目录", silent = true })

    -- 自动关闭 nvim 当只剩下树窗口
    vim.api.nvim_create_autocmd("BufEnter", {
      nested = true,
      callback = function()
        if
          #vim.api.nvim_list_wins() == 1
          and vim.bo.filetype == "NvimTree"
        then
          vim.cmd("quit")
        end
      end,
    })
  end,
}

