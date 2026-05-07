vim.pack.add({
	{
		src = "https://github.com/akinsho/bufferline.nvim",
		version = "main",
	},
})

require("bufferline").setup({
      options = {
        separator_style = "slope",
        diagnostics = "nvim_lsp",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Nvim Tree",
            separator = false,
            text_align = "left",
          },
        color_icons = false,
        persist_buffer_sort = true,
        -- move_wraps_at_ends = false,

        -- sort_by = "relative_directory", --'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' 
        sort_by = "directory",
        },
      }
})

