return {
	'akinsho/bufferline.nvim', 
	version = "*", 
	depenaencies = 'nvim-tree/nvim-web-devicons',
  opts = {
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
    },
	keys = {
		{"<Tab>", "<cmd>bn<cr>", desc = "prev buffer "},
		{"<S-Tab>", "<cmd>bp<cr>", desc = "next buffer "},
		{"<leader>x", "<cmd>bdelete<CR>", desc = "close buffer "},
	},
}
