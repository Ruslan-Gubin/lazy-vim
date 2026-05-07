vim.pack.add({
	{
		src = "https://github.com/lukas-reineke/indent-blankline.nvim",
		version = 'master',
	},
})

require("ibl").setup({
	indent = {
		char = "▏",
	},
	exclude = {
		filetypes = {
			"help",
			"notify",
			"lazy",
			"noice",
		},
	},
})
