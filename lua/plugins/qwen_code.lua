return {
  {
    "gitsang/qwen-code.nvim",
    cmd = "Qwen",
    keys = {
      { "<leader>qq", "<cmd>Qwen toggle<cr>", desc = "Toggle Qwen CLI" },
      { "<leader>qa", "<cmd>Qwen ask<cr>", desc = "Ask Qwen", mode = { "n", "v" } },
      { "<leader>qf", "<cmd>Qwen add_file<cr>", desc = "Add File" },

    },
    dependencies = {
      "folke/snacks.nvim",
    },
    config = true,
  }
}
