vim.pack.add({
  {
  src = "https://github.com/neph-iap/easycolor.nvim",
  version = "main",
  },
})


require("easycolor").setup({
	ui = {
		border = "rounded", -- Border style of the window
		symbols = {
			selection = "󰆢", -- The symbol to draw over the selected color
			hue_arrow = "◀" -- The arrow to draw next to the selected hue
		},
		mappings = {
			q = "close_window", -- The action when q is pressed, close window by default.
			j = "move_cursor_down", -- The action when j is pressed, move cursor down by default.
			k = "move_cursor_up", -- The action when k is pressed, move cursor up by default.
			h = "move_cursor_left", -- The action when h is pressed, move cursor left by default.
			l = "move_cursor_right", -- The action when l is pressed, move cursor right by default.
			["<Tab>"] = "hue_down", -- The action when <Tab> is pressed, hue down by default.
			["<S-Tab>"] = "hue_up", -- The action when <S-Tab> is pressed, hue up by default.
			["<Enter>"] = "insert_color", -- The action when <Enter> is pressed, insert color by default.
			t = "edit_formatting_template" -- The action when t is pressed, edit formatting template by default.
		}
	},
	formatting = {
		default_format = "$X"
	}
})
