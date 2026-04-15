vim.pack.add({
	"https://github.com/folke/which-key.nvim",
})

local wk = require("which-key")

wk.setup({
	preset = "modern",
})

local function cmd(command)
  return "<Cmd>" .. command .. "<CR>"
end

wk.add({
  {
    "<c-w><leader>",
    function()
      -- Кроме сочетания <c-w>w в принципе ничего не нужно
      wk.show({ keys = "<c-w>", loop = true })
    end,
    desc = "Window Hydra Mode (which-key)",
  },

 -- Spellcheck
  {"<leader>ss",
  function()
    local current_state = vim.o.spell
    local bufnr = vim.api.nvim_get_current_buf()

    if current_state then
      local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "harper_ls" })
      for _, client in ipairs(clients) do
        client:stop()
      end
      vim.o.spell = false
      vim.notify("Disabled Spell + Harper")
    else
      vim.o.spell = true
      vim.lsp.enable("harper_ls", bufnr)
      vim.notify("Enabled Spell + Harper")
    end
  end, 
    desc = "Toggle Spell + Harper",
  },

  { "<Esc><Esc>", vim.cmd.nohlsearch,            desc = "Clear search highlight" },

  -- Перемещение по перенесенным строкам как по физическим
  { "k",          "gk",                          silent = true },
  { "j",          "gj",                          silent = true },
  { "<Up>",       "gk",                          silent = true },
  { "<Down>",     "gj",                          silent = true },

  -- Window Navigation
  { "<C-h>",      cmd [[wincmd h]],              desc = "Go to left window" },
  { "<C-j>",      cmd [[wincmd j]],              desc = "Go to window below" },
  { "<C-k>",      cmd [[wincmd k]],              desc = "Go to window above" },
  { "<C-l>",      cmd [[wincmd l]],              desc = "Go to right window" },

-- Indentation
  -- Конфликтуют с >}
  { ">",          ">>",                          desc = "Indent" },
  { "<",          "<<",                          desc = "Unindent" },

  -- Move Lines
  { "<M-j>",      "<Esc>:m .+1<CR>==",           desc = "Move line down" },
  { "<M-k>",      "<Esc>:m .-2<CR>==",           desc = "Move line up" },
  { "<M-j>",      "<Esc>:m .+1<CR>==gi",         desc = "Move line down",        mode = "i" },
  { "<M-k>",      "<Esc>:m .-2<CR>==gi",         desc = "Move line up",          mode = "i" },
  { "<M-j>",      ":m '>+1<CR>gv=gv",            desc = "Move selection down",   mode = "v" },
  { "<M-k>",      ":m '<-2<CR>gv=gv",            desc = "Move selection up",     mode = "v" },

  { "<leader>-",  vim.cmd.split,                 desc = "Horizontal split" },
  { "<leader>|",  vim.cmd.vsplit,                desc = "Vertical split" },


-- buffer line
		{"<Tab>", "<cmd>bn<cr>", desc = "prev buffer "},
		{"<S-Tab>", "<cmd>bp<cr>", desc = "next buffer "},
		{"<leader>x", "<cmd>bdelete<CR>", desc = "close buffer "},

-- NeoTree
  { "<leader>e", cmd [[Neotree toggle]], desc = "Explorer NeoTree" },

-- Color picker
  { "<leader>up", cmd [[EasyColor]], desc = "Easy color picker" },

	{
		"<leader>b",
		group = "buffer",
		expand = function()
			return require("which-key.extras").expand.buf()
		end,
	},
	{
		"<leader>w",
		group = "windows",
		proxy = "<c-w>",
		expand = function()
			return require("which-key.extras").expand.win()
		end,
	},
	-- better descriptions
	-- { "gx", desc = "Open with system app" },
	{
		"<leader>fC",
		group = "Copy Path",
		{
			"<leader>fp",
			function()
				vim.fn.setreg("+", vim.fn.expand("%:p")) -- Copy full file path to clipboard
				vim.notify("Copied full file path: " .. vim.fn.expand("%:p"))
			end,
			desc = "Copy full file path",
		},
    { "<leader>ff", cmd [[Telescope find_files]], desc = "Telescope find file" },
    { "<leader>fw", cmd [[Telescope live_grep]], desc = "Telescope live grep" },
    { "<leader>fb", cmd [[Telescope buffers]], desc = "Telescope buffers" },
		{
			"<leader>fn",
			function()
				vim.fn.setreg("+", vim.fn.expand("%:t")) -- Copy file name to clipboard
				vim.notify("Copied file name: " .. vim.fn.expand("%:t"))
			end,
			desc = "Copy file name",
		},
		{
			"<leader>fr",
			function()
				local cwd = vim.fn.getcwd() -- Current working directory
				local full_path = vim.fn.expand("%:p") -- Full file path
				local rel_path = full_path:sub(#cwd + 2) -- Remove cwd prefix and leading slash
				vim.fn.setreg("+", rel_path) -- Copy relative file path to clipboard
				vim.notify("Copied relative file path: " .. rel_path)
			end,
			desc = "Copy relative file path",
		},
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Keymaps (which-key)",
		},
		{
			"<c-w><space>",
			function()
				require("which-key").show({ keys = "<c-w>", loop = true })
			end,
			desc = "Window Hydra Mode (which-key)",
		},
	},
})

