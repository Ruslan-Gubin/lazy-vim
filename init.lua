require "config.options"
require("config.autocmds")
require("config.lazy")
require("config.keys")

vim.cmd("colorscheme kanagawa")

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
   "vtsls",
   "vue_ls"
}


if vim.g.lsp_on_demands then
    vim.lsp.enable(vim.g.lsp_on_demands)
end
