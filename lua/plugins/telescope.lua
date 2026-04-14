vim.pack.add({
	{
		src = "https://github.com/nvim-telescope/telescope.nvim",
		version = "master",
	},
})

 require("telescope").setup{
  defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
              prompt_position = "top",
              preview_width = 0.5,
          },
        },
        sorting_strategy = "ascending",
  },
}

