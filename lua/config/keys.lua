local map = vim.keymap.set

 map("n", ";", ":", { desc = "CMD enter command mode" })
 map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save" })
 map("i", "jj", "<ESC>")
 -- map("n", "<leader>e", ":NvimTreeToggle<CR>", {})

 map("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
 map("n", "grt", vim.lsp.buf.type_definition, { desc = "LSP: Type Definition" })

local function cmd(command)
  return "<Cmd>" .. command .. "<CR>"
end

local which_key_ok, wk = pcall(require, "which-key")
if not which_key_ok then
  return
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

 -- Spellcheck
  { "<leader>ss", cmd [[setlocal spell!]],       desc = "Toggle Spellcheck" },
})

-- NeoTree
wk.add({
  { "<leader>e", cmd [[Neotree toggle]], desc = "Explorer NeoTree" },
})

-- Debugger
--[[ wk.add({
  { "<F5>",  function() require 'dap'.continue() end,          desc = "Debug: Start/Continue" },
  -- Shift-F5 не работает у меня в alacritty/zellij
  { "<F6>",  function() require 'dap'.terminate() end,         desc = "Debug: Terminate" },
  { "<F9>",  function() require 'dap'.toggle_breakpoint() end, desc = "Debug: Toggle breakpoint" },
  { "<F10>", function() require 'dap'.step_over() end,         desc = "Debug: Step over" },
  { "<F11>", function() require 'dap'.step_into() end,         desc = "Debug: Step into" },
  { "<F12>", function() require 'dap'.step_out() end,          desc = "Debug: Step out" },
  { "<M-e>", function() require 'dapui'.eval() end,            desc = "Debug: Evaluate expression", mode = { "n", "v" } },
}) ]]


