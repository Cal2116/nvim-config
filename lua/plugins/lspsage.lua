return {
	"nvimdev/lspsaga.nvim",
	cmd = "Lspsaga",
	opts = {
		finder = {
			keys = {
				toggle_or_open = "<CR>",
			},
		},
	},
	keys = {
    { "<leader>lr", ":Lspsaga rename<CR>" },
    { "<leader>ld", ":Lspsaga goto_definition<CR>" },
    { "<leader>lR", ":Lspsaga finder<CR>" },
	},
}
