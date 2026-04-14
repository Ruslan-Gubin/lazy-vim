vim.pack.add({
	{
		src = "https://github.com/akinsho/bufferline.nvim",
		version = "main",
	},
})

require("bufferline").setup({

      options = {
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Nvim Tree",
            separator = true,
            text_align = "left",
          },
        },
      }
})

