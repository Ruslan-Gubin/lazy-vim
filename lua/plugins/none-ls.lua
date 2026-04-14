vim.pack.add({
	{
		src = "https://github.com/nvimtools/none-ls.nvim",
		version = "main",
	},
	{
		src = "https://github.com/davidmh/cspell.nvim",
		version = "main",
	},
})

local cspell = require("cspell")

local config = {
	config_file_preferred_name = "cspell.json",
	cspell_config_dirs = { "~/.config/nvim/cspell.json" },
	language = "en,ru",
}

require("null-ls").setup({
	sources = {
		cspell.diagnostics.with({ config = config }),
		cspell.code_actions.with({ config = config }),
	},
})
