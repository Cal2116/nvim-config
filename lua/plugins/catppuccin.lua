-- 主题
return {
  "catppuccin/nvim",
  opts = {
    flavour = "mocha"
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme catppuccin")
  end
}
