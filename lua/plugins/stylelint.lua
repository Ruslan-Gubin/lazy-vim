vim.pack.add({
	{
		src = "https://github.com/leiswatch/nvim-stylelint",
		version = "main",
	},
})

require("nvim-stylelint").setup({
  opts = {},
})
