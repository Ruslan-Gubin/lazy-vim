vim.pack.add({
    'https://github.com/nvim-lualine/lualine.nvim'
})

require("lualine").setup({
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
        }
})
