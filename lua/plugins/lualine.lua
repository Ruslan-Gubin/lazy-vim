vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim',
})


require("lualine").setup({
  options = {
    theme = 'codedark',

  },
  sections = {
          lualine_c = {
            'filename',
            'lsp_status',
          },
          lualine_x = {
            {
              function()
                if vim.opt.iminsert:get() > 0 and vim.b.keymap_name then
                  return '⌨ ' .. vim.b.keymap_name
                end
                return ''
              end,
              cond = function()
                return vim.opt.iminsert:get() > 0 and vim.b.keymap_name ~= nil
              end,
            },
            'encoding',
            'fileformat',
            'filetype',
          }
        },
        theme = {
              normal = { c = { fg = "#bbc2cf", bg = "#202328" }, x = { fg = "#bbc2cf", bg = "#202328" } },
              inactive = { c = { fg = "#bbc2cf", bg = "#202328" , x = { fg = "#bbc2cf", bg = "#202328" }} },
          },
})
