return {
  "rebelot/kanagawa.nvim",
  lazy = true,
  opts = {
    dimInactive = true, -- dim inactive window `:h hl-NormalNC`
    colors = {
      palette = {
        surimiOrange = "#FFA066" -- Constants, imports, booleans
      },
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },

    overrides = function(colors)
      return {}
    end,
    theme = 'lotus', -- wave / lotus / dragon
    background = {
      dark = "wave",
      light = "lotus"
    }
  },
}
