-- plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- 图标支持
  },
  config = function()
    local nvim_tree = require("nvim-tree")

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
      actions = {
        open_file = {
          quit_on_open = true, -- 打开文件后自动关闭文件树
        },
      },
    })

    -- 快捷键绑定
    vim.keymap.set("n", "<leader>te", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree", silent = true })
    vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", { desc = "Find file in NvimTree", silent = true })

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

    -- 启动时自动打开树
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("nvim-tree.api").tree.open()
      end,
    })
  end,
}

