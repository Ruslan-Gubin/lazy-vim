return {
  "nvim-lua/plenary.nvim",
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {
      defaults = {},
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>c", group = "buffer" },
          { "<leader>r", group = "code" },
          { "<leader>f", group = "file/find" },
          { "<leader>x", group = "diagnostics/quickfix", icon = { icon = "󱖫 ", color = "green" } },
        },
      },
    },
  },
}
