vim.pack.add({
  {
  src = "https://github.com/rebelot/kanagawa.nvim",
  version = "master",
  },
})


require("kanagawa").setup({
    dimInactive = true,
    colors = {
      palette = {
        surimiOrange = "#FFA066" -- Constants, imports, booleans
      },
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
            -- bg_gutter = "#181515",
          },
        },
      },
    },

    overrides = function(colors)
      return {}
    end,
    theme = 'wave', -- wave / lotus / dragon
    background = {
      dark = "wave",
      light = "lotus"
    }
})

