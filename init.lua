require "config.options"
require("config.autocmds")
require("config.lazy")
require("config.keys")

require("kanagawa").load "wave"

local ts_server = vim.g.lsp_typescript_server or "ts_ls" 

vim.lsp.enable {
   ts_server,
   "cssls",
   "lua_ls",
   "json",
   "eslint",
   "biome",
   "html",
   "css_variables",
}


if vim.g.lsp_on_demands then
    vim.lsp.enable(vim.g.lsp_on_demands)
end
