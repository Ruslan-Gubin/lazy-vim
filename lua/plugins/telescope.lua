return {
    'nvim-telescope/telescope.nvim', 
    tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	    local builtin = require('telescope.builtin')

      local actions = require("telescope.actions")
      local open_with_trouble = require("trouble.sources.telescope").open
      local add_to_trouble = require("trouble.sources.telescope").add

      local telescope = require("telescope")
     telescope.setup({
      defaults = {
        i = { ["<c-t>"] = open_with_trouble },
        n = { ["<c-t>"] = open_with_trouble },
      }
    })

      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    end,
}
