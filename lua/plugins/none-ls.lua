return {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = { "davidmh/cspell.nvim" },
    opts = function(_, opts)
      local cspell = require("cspell")

          local config = {
            config_file_preferred_name = 'cspell.json',
            cspell_config_dirs = { "~/.config/nvim/cspell.json" },
            language = "en,ru",
          }

      require("null-ls").setup {
          sources = {
              cspell.diagnostics.with({ config = config }),
              cspell.code_actions.with({ config = config }),
          }
      }
    end,
}
