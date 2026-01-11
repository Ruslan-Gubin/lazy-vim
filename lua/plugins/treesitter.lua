return {
  "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "vue", "css" },
      sync_install = false,-- Но если включена автоматическая установка, никакие парсеры прописывать не надо
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(lang, buf)
          local max_filesize = 100 * 1024
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
       -- additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end
}
