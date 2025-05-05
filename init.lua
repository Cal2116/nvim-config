vim.g.mapleader = " "

require("core.basic")
require("core.keymap")
require("core.lazy")

vim.opt.termguicolors = true
require("bufferline").setup{}

vim.opt.clipboard = "unnamedplus"  -- 使用系统剪贴板

