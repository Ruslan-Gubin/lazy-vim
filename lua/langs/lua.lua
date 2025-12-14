return {
  {
    "nvim-treesitter/nvim-treesitter",
    optional = true,
    opts = { ensure_installed = { "vim", "regex", "lua", "bash" } },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", 
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}
