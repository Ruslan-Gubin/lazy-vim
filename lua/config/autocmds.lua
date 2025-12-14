local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
  return vim.api.nvim_create_augroup("my_nvim_" .. name, { clear = true })
end

 autocmd({ "BufWritePost" }, {
  callback = function()
   vim.lsp.buf.format {
      async = false
    }
  end,
})

 autocmd( "BufReadPost" , {
  command = 'setlocal spell'
})

-- Меняем рабочий каталог при запуске nvim
autocmd("VimEnter", {
  callback = function(data)
    if vim.fn.isdirectory(data.file) == 1 then
      vim.api.nvim_set_current_dir(data.file)
    end
  end,
})

-- .env .env.developer *
 autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup "env_filetype",
  pattern = { "*.env", ".env.*" },
  callback = function()
    vim.opt_local.filetype = "sh"
  end,
})


-- LSP change or blink \ native
-- local completion = vim.g.completion_mode or "native"
--  autocmd("LspAttach", {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client then
--       -- Built-in completion
--       if completion == "native" and client:supports_method "textDocument/completion" then
--         vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
--       end
--
--       -- Inlay hints
--       if client:supports_method "textDocument/inlayHints" then
--         vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
--       end
--     end
--   end,
-- })

-- wrap and spell, markdown || commit
--[[ vim.api.nvim_create_autocmd("FileType", {
  group = augroup "wrap_spell",
  pattern = { "*.txt", "*.tex", "*.typ", "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
}) ]]

