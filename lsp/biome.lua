local BIOME_CONFIG = { "biome.json", "biome.jsonc" }
local GLOBAL_BIOME_CONFIG = vim.fn.expand("~/.config/nvim/biome.json")

local ok, global_config = pcall(vim.json.read, vim.fn.readfile(GLOBAL_BIOME_CONFIG))
if not ok or not global_config then
	global_config = {
		linter = {
			rules = {
      recommended = true,
      correctness = {
        noVar = "warn",
        noUnusedVariable = "off"
      }
			},
		},
	}
end

return {
	cmd = function(dispatchers, config)
		local cmd = "biome"
		local local_cmd = (config or {}).root_dir and config.root_dir .. "/node_modules/.bin/biome"
		if local_cmd and vim.fn.executable(local_cmd) == 1 then
			cmd = local_cmd
		end
		return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
	end,
	filetypes = {
		"astro",
		"css",
		"graphql",
		"html",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
		"svelte",
		"typescript",
		"typescript.tsx",
		"typescriptreact",
		"vue",
	},
	workspace_required = true,
	root_dir = function(_, on_dir)
		local cwd = vim.fn.getcwd()
		local root_dir = vim.fs.dirname(vim.fs.find(BIOME_CONFIG, { path = cwd, upward = true })[1])
		on_dir(root_dir or vim.fs.root(0, "package.json"))
	end,
}
-- old
-- local BIOME_CONFIG = { "biome.json", "biome.jsonc" }
--
-- return {
-- 	cmd = function(dispatchers, config)
-- 		local cmd = "biome"
-- 		local local_cmd = (config or {}).root_dir and config.root_dir .. "/node_modules/.bin/biome"
-- 		if local_cmd and vim.fn.executable(local_cmd) == 1 then
-- 			cmd = local_cmd
-- 		end
-- 		return vim.lsp.rpc.start({ cmd, "lsp-proxy" }, dispatchers)
-- 	end,
-- 	filetypes = {
-- 		"astro",
-- 		"css",
-- 		"graphql",
-- 		"html",
-- 		"javascript",
-- 		"javascriptreact",
-- 		"json",
-- 		"jsonc",
-- 		"svelte",
-- 		"typescript",
-- 		"typescript.tsx",
-- 		"typescriptreact",
-- 		"vue",
-- 	},
-- 	workspace_required = true,
-- 	root_dir = function(_, on_dir)
-- 		-- To support monorepos, biome recommends starting the search for the root from cwd
-- 		-- https://biomejs.dev/guides/big-projects/#use-multiple-configuration-files
-- 		local cwd = vim.fn.getcwd()
-- 		local root_dir = vim.fs.dirname(vim.fs.find(BIOME_CONFIG, { path = cwd, upward = true })[1])
-- 		on_dir(root_dir)
-- 	end,
-- }
